//
//  addNewBankAcc.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import UIKit
import SKActivityIndicatorView

extension addNewBankAccVC : addNewBankView {
    func backScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showSuccessMsg(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showImage() {
        self.Selectedimage.isHidden = false
    }
    
    func hideImage() {
        self.Selectedimage.isHidden = true
    }
    
    func openCamera() {
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
//
//            self.picker.delegate = self
//
//            self.picker.sourceType = UIImagePickerController.SourceType.camera
//                            self.picker.cameraCaptureMode = .photo
//
//                            self.picker.allowsEditing = true
//
//                            self.picker.modalPresentationStyle = .fullScreen
//
//
//            self.present(picker, animated: true, completion: nil)
//

           
            
        
        
        
        
        
       // }
        
        
        
    }
    
    func AddBtnTopCorners() {
        self.addOutlet.AddTOPCorners(num : 25)
        
    }
    
    
}

