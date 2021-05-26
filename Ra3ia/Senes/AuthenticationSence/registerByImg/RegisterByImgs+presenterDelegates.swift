//
//  RegisterByImgs+presenterDelegates.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import UIKit
import SKActivityIndicatorView
 

extension registerByImgsVC : registerBYimagesView {
    func showMsg(msg: String) {
        completData(title: "", message: msg)
    }
    
    func showALERT(aleert: String) {
       completData(title: "", message: aleert)
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
    
    func shownavBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    func gotoVerfication() {
        
   
        let vc = Storyboard.Authntication.viewController(verificationVc.self)
        self.navigationController?.pushViewController(vc, animated: true)
     
    }
    
    func showvhicleImagepicker() {
        vhicelPicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        vhicelPicker.allowsEditing = true
        vhicelPicker.delegate = self

      self.present(vhicelPicker, animated: false, completion: nil)
       
        
    }
    
    func showIDimagePicker() {
        idPicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        idPicker.allowsEditing = true
        idPicker.delegate = self

      self.present(idPicker, animated: false, completion: nil)
        
        
    }
    
    func showDrivingLicence() {
        DrivingLicense.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        DrivingLicense.allowsEditing = true
        DrivingLicense.delegate = self

      self.present(DrivingLicense, animated: false, completion: nil)
        
    }
    
    func ShowUserPicker() {
      
        userPicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        userPicker.allowsEditing = true
        userPicker.delegate = self

      self.present(userPicker, animated: false, completion: nil)
    }
        
        

    
   
}



