//
//  editPassword+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/2/21.
//

import Foundation
import SKActivityIndicatorView


extension editPasswordVC : editPasswordView {
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
    
    func BackHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
            
                window.rootViewController = Vc
            }
        
    }
    
    
    
}
