//
//  MoreVCPresenter.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/20/21.
//
import Foundation



//MARK:- protocols


protocol MoreView: class {
    func fetchingDataSuccess()
    func goToNotifications()
    func goToProfile()
    func showAnimated()
    func GoToLanguage()
    func GoToFinancialAcc()
    func GotoBankAccounts()
    func GotoWalletScreen()
    func GotoMyBillsScreen()
    func GoToMyReviewsScreen()
    func GotoCallUsScreen()
    func GotoUsagePolicyScreen()
    func GotoSuggestionScreen()
    func LogOutFromApp()
    func setUpTabel()
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
    func showSuccess(msg: String)
    func LogOut()
    
    
    
}


protocol MoreCellsView {
    func displayMainLabel(name: String)
    func displayDetails(name: String)
    func displayImage(image: String)
}

//MARK:- presenter class

class MoreVcPresenter {
    //MARK:- 1 variabals
    
    private weak var view : MoreView?
    // cells
    
   private var imagesArray = ["acc","language","fain", "baank" , "walllet" , "bills" , "rates","phone" ,"terms" ,"shkwa" ,"logout"]
    
    private var mainLabelsArray = ["Personal data".localized,
                                   "Language".localized,
                                   "Financial accounts".localized,
                                   "Bank accounts".localized,
                                   "My wallet".localized,
                                   "My bills".localized,
                                   "My review".localized,
                                   "Call Us".localized,
                                   "Usage policy".localized,
                                   "Complaints and suggestions".localized,
                                   "Log Out".localized
    ]
    
    private var DetailsLabelsArray = ["personal information".localized,
                                      "Language control".localized,
                                      "You can pay the app commission from here".localized,
                                      "You can add your bank accounts from here".localized,
                                      "You can see your balance".localized ,
                                      "Financial movements of the buying and selling process".localized,
                                      "You can see your review from here".localized,
                                      "Is there a problem? We will help you solve it".localized ,
                              
                                      "Any terms and conditions are updated in the application".localized,
                                      "Send your complaint or suggestion from here".localized,
                                      "You can logOut your account from here".localized
                           
                              
    ]
    
    //MARK:- 2 view initionalizer
    
    init(view: MoreView) {
        self.view = view
    }
    
    //MARK: - 3 class functions
    
    func getcellsCount() -> Int {
        return mainLabelsArray.count
    }
    
    func configure(cell: MoreSettingCell, for index: Int) {
        cell.displayMainLabel(name: self.mainLabelsArray[index])
        cell.displayDetails(name: self.DetailsLabelsArray[index])
        cell.displayImage(image: self.imagesArray[index])
    }
    
    func showAnimation(){
        view?.showAnimated()
    }
    //MARK: - 3 Did Select Row
    func DidSelectRow(index:Int){
        switch index {
        case 0:
            self.view?.goToProfile()
        case 1 :
            self.view?.GoToLanguage()
        case 2:
            self.view?.GoToFinancialAcc()
        case 3 :
            self.view?.GotoBankAccounts()
        case 4 :
            self.view?.GotoWalletScreen()
        case 5 :
            self.view?.GotoMyBillsScreen()
        case 6 :
            self.view?.GoToMyReviewsScreen()
        case 7 :
            self.view?.GotoCallUsScreen()
        case 8 :
            self.view?.GotoUsagePolicyScreen()
        case 9 :
            self.view?.GotoSuggestionScreen()
        case 10 :
            self.view?.LogOut()
              
        default:
            break
        }
    }
    
    
    func ViewDidLoad () {
        self.view?.setUpTabel()
    }
    func GotoNotificationScreen () {
        self.view?.goToNotifications()
    }
    func LogOutApp(){
        view?.showIndicator()
        TabBarinteractor.logout(device_id: AppDelegate.FCMTOKEN).send(DefaultResponse.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccess(msg: value.msg ?? "")
                SocketConnection.sharedInstance.socket.disconnect()
                KeyChain.deleteToken()
                User.currentUser = nil
                self.view?.LogOutFromApp()
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
    
}

