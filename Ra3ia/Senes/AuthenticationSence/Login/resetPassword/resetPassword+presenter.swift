//
//  resetPassword.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/26/21.
//

import Foundation
import SKActivityIndicatorView


extension resetPasswordVc : resetPasswordView {
    func makeRoundBtn() {
        self.confirmOutlet.AddTOPCorners(num: 25)
    }
    
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
    
    func goToLoginScreen() {
        let vc = Storyboard.Authntication.viewController(LoginVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
