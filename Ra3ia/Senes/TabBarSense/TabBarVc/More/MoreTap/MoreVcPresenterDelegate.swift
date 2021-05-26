//
//  MoreVcPresenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/21/21.
//

import UIKit
import ViewAnimator
import SKActivityIndicatorView




extension MoreVC : MoreView {
    func showIndicator() {
    SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
        
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
        
    }
    
    func LogOutFromApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            guard let window = UIApplication.shared.keyWindow else { return }
            let vc = Storyboard.Authntication.initialViewController()
            window.rootViewController = vc
        }
    }
    
    func LogOut(){
        
        
//        let alert = UIAlertController(title: "Sign Out".localized(), message: "Are you sure you want to log out?".localized(), preferredStyle: .alert)
//
        let alert = UIAlertController()
        alert.customAlert(title: "Sign Out".localized(), message:"Are you sure you want to log out?".localized() )
        
            
            
            
        alert.addAction(UIAlertAction(title: "OK".localized(), style: .default, handler: { action in
            self.presenter.LogOutApp()
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    func GoToLanguage() {
         let vc = Storyboard.Main.viewController(LanguageVC.self)
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func GoToFinancialAcc() {
        let vc = Storyboard.Main.viewController(finincialAccountVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func GotoBankAccounts() {
        let vc = Storyboard.Main.viewController(bankAccountsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func GotoWalletScreen() {
        let vc = Storyboard.Main.viewController(myWalletVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func GotoMyBillsScreen() {
        let vc = Storyboard.Main.viewController(myBillsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func GoToMyReviewsScreen() {
        let vc = Storyboard.Main.viewController(MyReviewVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func GotoCallUsScreen() {
        let vc = Storyboard.Main.viewController(CallUsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func GotoUsagePolicyScreen() {
        let vc = Storyboard.Main.viewController(UsagePolicyVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func GotoSuggestionScreen() {
        let vc = Storyboard.Main.viewController(ComplaintsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
  
    
    func goToProfile() {
        let vc = Storyboard.Main.viewController(personalInfoVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func goToNotifications() {
        let vc = Storyboard.Main.viewController(notificationsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
      
    }
    func fetchingDataSuccess() {
        self.tableview.reloadData()
        presenter.showAnimation()
        
    }
    
 
    func showAnimated() {
        let fromAnimation = AnimationType.vector(CGVector(dx: 50 , dy: 0))

                      UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.5 )

    }
    
    func setUpTabel() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
       
    }
    
    
    
}
