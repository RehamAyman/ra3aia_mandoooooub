//
//  RegisterVC+presenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import Foundation
 import SPAlert
import SKActivityIndicatorView

extension Registervc : RegisterView , sendDataBackDelegate  {
    func finishPassing(location: String, lat: Double, lng: Double) {
        self.AddressField.text = location
        self.lat = lat
        self.lng = lng
    }
    
    
    
    func gotoSelectLocation() {
//        let vc = Storyboard.Authntication.viewController(SelectLocationViewController.self)
//        vc.delegate = self
//                                
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    func passingDataToNextPage() {
        
        if firstName.text == "" || UserNameTextField.text == "" || PhoneNumField.text == "" || emailField.text == "" || AddressField.text == "" || PasswordField.text == "" || retypePasswordField.text == "" {
            completData(title: "", message: "please complete your data !")
        }
       else if checkMark.on == true{
            GotoNextPage()
          
        } else if checkMark.on == false {
            showWarningAlert(title: "", message: "You must agree to the terms and conditions first".localized())
        }
        
        
        
    
    }
    
    func gotoTermsScreen() {
        
        
        
        
    }
    func showMsg(msg: String) {
        completData(title: "", message: msg)
    }
    
  
    func GotoNextPage() {
       
        if  PasswordField.text == retypePasswordField.text {
        let vc = Storyboard.Authntication.viewController(registerByImgsVC.self)
        vc.email = emailField.text ?? ""
        vc.password = PasswordField.text ?? ""
        vc.address = AddressField.text ?? ""
        vc.Lname = UserNameTextField.text ?? ""
        vc.Fname = firstName.text ?? ""
        vc.phone = PhoneNumField.text ?? ""
        
        
        navigationController?.pushViewController(vc, animated: true)
        }  else {
            
            showWarningAlert(title: "", message: "Password and confirm password must be match. ".localized())
           // showErrorAlert(title: "", message:"Password and confirm password must be match. ".localized() )
        }
        
    }
    
    func ViewDidLoad() {
        checkMark.boxType = .square
    }
  
    
}
