//
//  personalInfo+Presenterdelegates.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/5/21.
//

import UIKit
import Kingfisher

import SKActivityIndicatorView


extension personalInfoVC : personalinfoView {
 
    func setEmail(email: String) {
        self.emailTXtField.text = email
    }
    
    func showSuccessMsg(msg: String) {
        showSuccessAlert(title: "", message: msg)
        makeIsNotEditble()
        
    }
    func ComplateData(msg: String) {
        completData(title: "", message: msg)
    }
    
    
    func featshData(dtaa: ProfileData) {
       
       
        self.userNameLBL.text = dtaa.name
        self.emailTXtField.text = dtaa.email
        self.phoneNumTxtField.text = dtaa.phone
        self.userNameTxtField.text = dtaa.fname
        lastNameTextField.text = dtaa.lname
        
       
        self.vehiclePic.setImageWith(dtaa.car_image)
        self.drivingPic.setImageWith(dtaa.licence_image)
        self.userImage.setImageWith(dtaa.avatar)
        self.IDpic.setImageWith(dtaa.id_image)
        
    
    }
    func hideSubmitBtn() {
        self.submitOutlet.isHidden = true
    
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
    func gotoEditPasswordScreen() {
        let vc = Storyboard.Main.viewController(editPasswordVC.self)
        navigationController?.pushViewController(vc, animated: true)
    }
   
    
   
    
   
    
  
    
  
    
    func showEditIDImagesBtn() {
        self.editIdOutlet.isHidden = false
    }
    
    func hideEditIDImagesBtn() {
        self.editIdOutlet.isHidden = true
    }
    
    func ShowEditVhicleBtn() {
        self.editVhicleOutlet.isHidden = false
    }
    
    func hideEditVhicleBtn() {
        self.editVhicleOutlet.isHidden = true
    }
    
    func showEditLicenseBtn() {
        self.editDrivingOutlet.isHidden = false
    }
    
    func hideEditLicenseBtn() {
        self.editDrivingOutlet.isHidden = true
    }
    
    func MakeImageRoundeed() {
        self.userImage.MakeRounded()
    }
  
 
    func editUserImage() {
        
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.submitOutlet.isHidden = false

      self.present(imagePicker, animated: false, completion: nil)
        
        
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
    
    func showvhicleImagepicker() {
        vhicelPicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        vhicelPicker.allowsEditing = true
        vhicelPicker.delegate = self

      self.present(vhicelPicker, animated: false, completion: nil)
        
    }
    
    func makeBtnRoundCorners() {
        self.submitOutlet.AddTOPCorners(num: 25)
    }
    
    
    func makeIsEditble(){
        self.userNameTxtField.isUserInteractionEnabled = true
        self.emailTXtField.isUserInteractionEnabled = true
        //self.phoneNumTxtField.isUserInteractionEnabled = true
        self.lastNameTextField.isUserInteractionEnabled = true
       
        self.userNameTxtField.layer.borderColor = UIColor.lightGray.cgColor
        self.emailTXtField.layer.borderColor = UIColor.lightGray.cgColor
       // self.phoneNumTxtField.layer.borderColor = UIColor.lightGray.cgColor
        self.lastNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.userNameTxtField.placeholder = "enter new user name ".localized()
        self.emailTXtField.placeholder = "enter new phone number ".localized()
        self.phoneNumTxtField.placeholder = "enter new email".localized()
        self.userNameTxtField.layer.applySketchShadow()
        self.lastNameTextField.layer.applySketchShadow()
       // self.phoneNumTxtField.layer.applySketchShadow()
        self.emailTXtField.layer.applySketchShadow()
        
        

        self.submitOutlet.isHidden = false
        
    }
    
    func makeIsNotEditble(){
        self.userNameTxtField.isUserInteractionEnabled = false
        self.emailTXtField.isUserInteractionEnabled = false
        self.phoneNumTxtField.isUserInteractionEnabled = false
        self.lastNameTextField.isUserInteractionEnabled = false
        userNameTxtField.layer.applySketchShadow(color: UIColor.white, alpha: 0, x: 0, y: 0, blur: 0, spread: 0)
        emailTXtField.layer.applySketchShadow(color: UIColor.white, alpha: 0, x: 0, y: 0, blur: 0, spread: 0)
        lastNameTextField.layer.applySketchShadow(color: UIColor.white, alpha: 0, x: 0, y: 0, blur: 0, spread: 0)
        phoneNumTxtField.layer.applySketchShadow(color: UIColor.white, alpha: 0, x: 0, y: 0, blur: 0, spread: 0)

        
        self.userNameTxtField.layer.borderColor = UIColor.white.cgColor
        self.emailTXtField.layer.borderColor = UIColor.white.cgColor
        self.phoneNumTxtField.layer.borderColor = UIColor.white.cgColor
        self.lastNameTextField.layer.borderColor = UIColor.white.cgColor
       

        
        self.submitOutlet.isHidden = true
        
    }
    
    
    
    
    
}
