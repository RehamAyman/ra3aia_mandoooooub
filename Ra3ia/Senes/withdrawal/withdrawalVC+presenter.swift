//
//  withdrawalVC+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/10/21.
//

import UIKit
import SKActivityIndicatorView


extension withdrawalResoneVC : WithdrawalReasonView {
    func showIndicator() {
        SKActivityIndicator.show()
        
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showSuccessMessage(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    
    func makeTopRoundView() {
        self.mainView.AddTOPCornersView(num: 20)
    }
    func backHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
            
                window.rootViewController = Vc
            }
        
    }
    
    
}
