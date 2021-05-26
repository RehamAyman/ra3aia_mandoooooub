//
//  LoginVc+Prisnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 24/03/2021.
//


import Foundation
import SKActivityIndicatorView



extension LoginVC:LoginView{
 
    func goTOhome() {
        
    }
    
   
    func gotoForgetPassword() {
        let vc = Storyboard.Authntication.viewController(ForgetPasswordVC.self)
       navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func setPaddingToTextFeild() {
        self.mobileNumber.setRightPaddingPoints(20)
     
        
        self.password.setRightPaddingPoints(20)
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
    
    
    
    func LoginToApplication(type: String) {

        showSuccessAlert(title: "", message: "You have signed in successfully".localized)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let window = UIApplication.shared.keyWindow else { return }
            let vc = Storyboard.Main.initialViewController()
            window.rootViewController = vc

        }
       
    }
    
    
    
   
    
    
    func goToRegister() {
        
        let vc = Storyboard.Authntication.viewController(Registervc.self)
        navigationController?.pushViewController(vc, animated: true)
        
        
       

    }
    
    
    
  
   
    
}
