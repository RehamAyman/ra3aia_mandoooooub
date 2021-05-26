//
//  verivication+PresenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import Foundation
import SKActivityIndicatorView



extension verificationVc : verificationView {
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showStatusalert(message: String) {
        showSuccessAlert(title: "", message: message )
    }
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
        self.LoginToApplication(type: "delegate")
    }
    
    func LoginToApplication(type: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
            
                window.rootViewController = Vc
            }
        
        }
    
    
    
    func gotoHomePage() {
     
        
    }
    
    
}
