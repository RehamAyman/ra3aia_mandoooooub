#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "STKAnalyticService.h"
#import "STKWebserviceManager.h"
#import "STKBadgeView.h"
#import "STKShowStickerButton.h"
#import "STKStatistic+CoreDataClass.h"
#import "STKStatistic+CoreDataProperties.h"
#import "STKSticker+CoreDataClass.h"
#import "STKSticker+CoreDataProperties.h"
#import "STKStickerPack+CoreDataClass.h"
#import "STKStickerPack+CoreDataProperties.h"
#import "NSManagedObject+STKAdditions.h"
#import "NSManagedObjectContext+STKAdditions.h"
#import "NSPersistentStoreCoordinator+STKAdditions.h"
#import "STKStickersCache.h"
#import "SKProduct+STKStickerSKProduct.h"
#import "STKStickerSettingsCell.h"
#import "STKStickersSettingsViewController.h"
#import "STKOrientationNavigationController.h"
#import "STKApiKeyManager.h"
#import "STKInAppProductsManager.h"
#import "STKUUIDManager.h"
#import "STKPurchaseService.h"
#import "STKStickersPurchaseService.h"
#import "STKStickersEntityService.h"
#import "STKStickersShopJsInterface.h"
#import "STKStickersShopViewController.h"
#import "STKEmptyRecentCell.h"
#import "STKStickerHeaderCell.h"
#import "STKStickerViewCell.h"
#import "STKStickerDelegateManager.h"
#import "STKStickerHeaderDelegateManager.h"
#import "STKStickersConstants.h"
#import "STKStickerController.h"
#import "STKStickersSeparator.h"
#import "STKImageManager.h"
#import "STKSearchDelegateManager.h"
#import "STKSearchModel.h"
#import "STKStickersManager.h"
#import "STKUtility.h"
#import "UIImage+CustomBundle.h"
#import "UIImage+Tint.h"
#import "UIImageView+Stickers.h"
#import "NSLayoutConstraint+Addictions.h"
#import "UIAlertController+ShortMessage.h"
#import "UIView+ActivityIndicator.h"
#import "UIView+CordsAdditions.h"
#import "UIView+LayoutAdditions.h"
#import "helper.h"
#import "Stickerpipe.h"

FOUNDATION_EXPORT double StickerpipeVersionNumber;
FOUNDATION_EXPORT const unsigned char StickerpipeVersionString[];

