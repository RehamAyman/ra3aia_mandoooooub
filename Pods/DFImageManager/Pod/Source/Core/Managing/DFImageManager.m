// The MIT License (MIT)
//
// Copyright (c) 2015 Alexander Grebenyuk (github.com/kean).
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DFCachedImageResponse.h"
#import "DFImageCaching.h"
#import "DFImageFetching.h"
#import "DFImageManager.h"
#import "DFImageManagerConfiguration.h"
#import "DFImageManagerDefines.h"
#import "DFImageManagerImageLoader.h"
#import "DFImageRequest.h"
#import "DFImageRequestOptions.h"
#import "DFImageResponse.h"
#import "DFImageTask.h"

#pragma mark - _DFImageTask

@class _DFImageTask;

@protocol _DFImageTaskManaging

- (void)resumeManagedTask:(nonnull _DFImageTask *)task;
- (void)cancelManagedTask:(nonnull _DFImageTask *)task;
- (void)managedTaskDidChangePriority:(nonnull _DFImageTask *)task;
- (nullable NSProgress *)progressForManagedTask:(nonnull _DFImageTask *)task;

@end

@interface _DFImageTask : DFImageTask

@property (nonnull, nonatomic, readonly) id<_DFImageTaskManaging> manager;
@property (nonatomic) DFImageTaskState state;
@property (nullable, atomic) NSProgress *internalProgress;
@property (nullable, atomic) UIImage *image;
@property (nullable, atomic) NSError *error;
@property (nullable, atomic) DFImageResponse *response;
@property (nonatomic) NSInteger tag;
@property (nonatomic) BOOL preheating;

@end

@implementation _DFImageTask

@synthesize completionHandler = _completionHandler;
@synthesize request = _request;
@synthesize priority = _priority;
@synthesize error = _error;
@synthesize response = _response;
@synthesize state = _state;

- (instancetype)initWithManager:(nonnull id<_DFImageTaskManaging>)manager request:(nonnull DFImageRequest *)request completionHandler:(nullable DFImageTaskCompletion)completionHandler {
    if (self = [super init]) {
        _manager = manager;
        _request = request;
        _priority = request.options.priority;
        _completionHandler = [completionHandler copy];
    }
    return self;
}

- (void)resume {
    [self.manager resumeManagedTask:self];
}

- (void)cancel {
    [self.manager cancelManagedTask:self];
}

- (void)setPriority:(DFImageRequestPriority)priority {
    if (_priority != priority) {
        _priority = priority;
        [self.manager managedTaskDidChangePriority:self];
    }
}

- (nullable NSProgress *)progress {
    return [self.manager progressForManagedTask:self];
}

- (BOOL)isValidNextState:(DFImageTaskState)nextState {
    switch (self.state) {
        case DFImageTaskStateSuspended:
            return (nextState == DFImageTaskStateRunning ||
                    nextState == DFImageTaskStateCancelled);
        case DFImageTaskStateRunning:
            return (nextState == DFImageTaskStateCompleted ||
                    nextState == DFImageTaskStateCancelled);
        default: return NO;
    }
}

@end


#pragma mark - DFImageManager

static inline void DFDispatchAsync(dispatch_block_t block) {
    ([NSThread isMainThread]) ? block() : dispatch_async(dispatch_get_main_queue(), block);
}

@interface DFImageManager () <_DFImageTaskManaging, DFImageManagerImageLoaderDelegate>

@property (nonnull, nonatomic, readonly) DFImageManagerImageLoader *imageLoader;
@property (nonnull, nonatomic, readonly) NSMutableSet /* _DFImageTask */ *executingTasks;
@property (nonnull, nonatomic, readonly) NSMutableDictionary /* _DFImageCacheKey : _DFImageTask */ *preheatingTasks;
@property (nonnull, nonatomic, readonly) NSRecursiveLock *recursiveLock;

@end

@implementation DFImageManager {
    NSInteger _preheatingTaskCounter;
    BOOL _invalidated;
    BOOL _needsToExecutePreheatingTasks;
}

DF_INIT_UNAVAILABLE_IMPL

- (nonnull instancetype)initWithConfiguration:(nonnull DFImageManagerConfiguration *)configuration {
    if (self = [super init]) {
        NSParameterAssert(configuration);
        _configuration = [configuration copy];
        _imageLoader = [[DFImageManagerImageLoader alloc] initWithConfiguration:configuration];
        _imageLoader.delegate = self;
        _preheatingTasks = [NSMutableDictionary new];
        _executingTasks = [NSMutableSet new];
        _recursiveLock = [NSRecursiveLock new];
    }
    return self;
}

+ (void)initialize {
    [self setSharedManager:[self createDefaultManager]];
}

- (void)_performBlock:(__attribute__((noescape)) void (^__nonnull)())block {
    [_recursiveLock lock];
    if (!_invalidated) {
        block();
    }
    [_recursiveLock unlock];
}

#pragma mark <DFImageManaging>

- (BOOL)canHandleRequest:(nonnull DFImageRequest *)request {
    NSParameterAssert(request);
    return [_configuration.fetcher canHandleRequest:request];
}

- (nonnull DFImageTask *)imageTaskForResource:(nonnull id)resource completion:(nullable DFImageTaskCompletion)completion {
    NSParameterAssert(resource);
    return [self imageTaskForRequest:[DFImageRequest requestWithResource:resource] completion:completion];
}

- (nonnull DFImageTask *)imageTaskForRequest:(nonnull DFImageRequest *)request completion:(nullable DFImageTaskCompletion)completion {
    NSParameterAssert(request);
    return [[_DFImageTask alloc] initWithManager:self request:request completionHandler:completion];
}

- (void)getImageTasksWithCompletion:(void (^ __nullable)(NSArray * __nonnull, NSArray * __nonnull))completion {
    NSMutableSet *tasks = [NSMutableSet new];
    NSMutableSet *preheatingTasks = [NSMutableSet new];
    [self _performBlock:^{
        for (_DFImageTask *task in _executingTasks) {
            [(task.preheating ? preheatingTasks : tasks) addObject:task];
        }
        [preheatingTasks addObjectsFromArray:_preheatingTasks.allValues];
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(tasks.allObjects, preheatingTasks.allObjects);
    });
}

- (void)invalidateAndCancel {
    [self _performBlock:^{
        [_preheatingTasks removeAllObjects];
        _imageLoader.delegate = nil;
        for (_DFImageTask *task in _executingTasks.allObjects) {
            [self _setImageTaskState:DFImageTaskStateCancelled task:task];
        }
        if ([_configuration.fetcher respondsToSelector:@selector(invalidate)]) {
            [_configuration.fetcher invalidate];
        }
        _invalidated = YES;
    }];
}

- (void)removeAllCachedImages {
    [_configuration.cache removeAllObjects];
    if ([_configuration.fetcher respondsToSelector:@selector(removeAllCachedImages)]) {
        [_configuration.fetcher removeAllCachedImages];
    }
}

#pragma mark <DFImageManaging> (Preheating)

- (void)startPreheatingImagesForRequests:(nonnull NSArray *)requests {
    [self _performBlock:^{
        for (DFImageRequest *request in requests) {
            id<NSCopying> key = [_imageLoader preheatingKeyForRequest:request];
            if (!_preheatingTasks[key]) {
                _DFImageTask *task = [[_DFImageTask alloc] initWithManager:self request:request completionHandler:nil];
                task.preheating = YES;
                task.tag = _preheatingTaskCounter++;
                _preheatingTasks[key] = task;
            }
        }
        [self _setNeedsExecutePreheatingTasks];
    }];
}

- (void)stopPreheatingImagesForRequests:(nonnull NSArray *)requests {
    [self _performBlock:^{
        for (DFImageRequest *request in requests) {
            id<NSCopying> key = [_imageLoader preheatingKeyForRequest:request];
            _DFImageTask *task = _preheatingTasks[key];
            if (task) {
                [self _setImageTaskState:DFImageTaskStateCancelled task:task];
            }
        }
    }];
}

- (void)stopPreheatingImagesForAllRequests {
    [self _performBlock:^{
        for (_DFImageTask *task in _preheatingTasks.allValues) {
            [self _setImageTaskState:DFImageTaskStateCancelled task:task];
        }
    }];
}

- (void)_setNeedsExecutePreheatingTasks {
    if (!_needsToExecutePreheatingTasks) {
        _needsToExecutePreheatingTasks = YES;
        // Manager won't start executing preheating tasks in case you are about to add normal (non-preheating) right after adding preheating ones.
        typeof(self) __weak weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf _performBlock:^{
                [weakSelf _executePreheatingTasksIfNeeded];
            }];
        });
    }
}

- (void)_executePreheatingTasksIfNeeded {
    _needsToExecutePreheatingTasks = NO;
    NSUInteger executingTaskCount = _executingTasks.count;
    if (executingTaskCount < _configuration.maximumConcurrentPreheatingRequests && _preheatingTasks.count) {
        for (_DFImageTask *task in [_preheatingTasks.allValues sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES]]]) {
            if (executingTaskCount >= _configuration.maximumConcurrentPreheatingRequests) {
                break;
            }
            if (task.state == DFImageTaskStateSuspended) {
                [self _setImageTaskState:DFImageTaskStateRunning task:task];
                executingTaskCount++;
            }
        }
    }
}

- (void)_imageTaskDidComplete:(_DFImageTask *)task {
    if (_preheatingTasks.count && (task.preheating || !task.error)) {
        [_preheatingTasks removeObjectForKey:[_imageLoader preheatingKeyForRequest:task.request]];
    }
}

#pragma mark FSM (DFImageTaskState)

- (void)_setImageTaskState:(DFImageTaskState)state task:(nonnull _DFImageTask *)task {
    if ([task isValidNextState:state]) {
        [self _transitionActionFromState:task.state toState:state task:task];
        task.state = state;
        [self _enterActionForState:state task:task];
    }
}

- (void)_transitionActionFromState:(DFImageTaskState)fromState toState:(DFImageTaskState)toState task:(nonnull _DFImageTask *)task {
    if (fromState == DFImageTaskStateRunning && toState == DFImageTaskStateCancelled) {
        [_imageLoader cancelLoadingForImageTask:task];
    }
}

- (void)_enterActionForState:(DFImageTaskState)state task:(nonnull _DFImageTask *)task {
    if (state == DFImageTaskStateRunning) {
        DFCachedImageResponse *response = [_imageLoader cachedResponseForRequest:task.request];
        if (response) { // fast path
            task.image = response.image;
            task.response = [[DFImageResponse alloc] initWithInfo:response.info isFastResponse:YES];
            [self _setImageTaskState:DFImageTaskStateCompleted task:task];
        } else {
            [_executingTasks addObject:task];
            [_imageLoader startLoadingForImageTask:task];
        }
    }
    if (state == DFImageTaskStateCompleted || state == DFImageTaskStateCancelled) {
        [_executingTasks removeObject:task];
        [self _setNeedsExecutePreheatingTasks];
        
        if (state == DFImageTaskStateCancelled) {
            task.error = [NSError errorWithDomain:DFImageManagerErrorDomain code:DFImageManagerErrorCancelled userInfo:nil];
        }
        if (state == DFImageTaskStateCompleted) {
            if (!task.image && !task.error) {
                task.error = [NSError errorWithDomain:DFImageManagerErrorDomain code:DFImageManagerErrorUnknown userInfo:nil];
            }
        }
        DFDispatchAsync(^{
            DFImageTaskCompletion completion = task.completionHandler;
            if (completion) {
                completion(task.image, task.error, task.response, task);
                task.image = nil;
            }
        });
        [self _imageTaskDidComplete:task];
    }
}

#pragma mark <DFImageManagerImageLoaderDelegate>

- (void)imageLoader:(nonnull DFImageManagerImageLoader *)imageLoader imageTask:(nonnull _DFImageTask *)task didUpdateProgressWithCompletedUnitCount:(int64_t)completedUnitCount totalUnitCount:(int64_t)totalUnitCount {
    NSProgress *progress = task.internalProgress;
    progress.totalUnitCount = totalUnitCount;
    progress.completedUnitCount = completedUnitCount;
}

- (void)imageLoader:(nonnull DFImageManagerImageLoader *)imageLoader imageTask:(nonnull DFImageTask *)task didReceiveProgressiveImage:(nonnull UIImage *)image {
    dispatch_async(dispatch_get_main_queue(), ^{
        void (^handler)(UIImage *__nonnull) = task.progressiveImageHandler;
        if (handler) {
            handler(image);
        }
    });
}

- (void)imageLoader:(nonnull DFImageManagerImageLoader *)imageLoader imageTask:(nonnull _DFImageTask *)task didCompleteWithImage:(nullable UIImage *)image info:(nullable NSDictionary *)info error:(nullable NSError *)error {
    task.image = image;
    task.response = [[DFImageResponse alloc] initWithInfo:info isFastResponse:NO];
    task.error = error;
    [self _performBlock:^{
        [self _setImageTaskState:DFImageTaskStateCompleted task:task];
    }];
}

#pragma mark <_DFImageTaskManaging>

- (void)resumeManagedTask:(nonnull _DFImageTask *)task {
    [self _performBlock:^{
        [self _setImageTaskState:DFImageTaskStateRunning task:task];
    }];
}

- (void)cancelManagedTask:(nonnull _DFImageTask *)task {
    [self _performBlock:^{
        [self _setImageTaskState:DFImageTaskStateCancelled task:task];
    }];
}

- (void)managedTaskDidChangePriority:(nonnull _DFImageTask *)task {
    [self _performBlock:^{
        [_imageLoader updateLoadingPriorityForImageTask:task];
    }];
}

- (nullable NSProgress *)progressForManagedTask:(nonnull _DFImageTask *)task {
    NSProgress *__block progress;
    [self _performBlock:^{
        progress = task.internalProgress;
        if (!progress) {
            progress = [NSProgress progressWithTotalUnitCount:-1];
            _DFImageTask *__weak weakTask = task;
            progress.cancellationHandler = ^{
                [weakTask cancel];
            };
            task.internalProgress = progress;
        }
    }];
    return progress;
}

@end
