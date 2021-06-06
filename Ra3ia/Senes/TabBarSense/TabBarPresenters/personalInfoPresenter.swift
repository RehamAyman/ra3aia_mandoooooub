//
//  personalInfoPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/5/21.
//

import Foundation
//protocols
protocol personalinfoView : class {
    func MakeImageRoundeed()
    func editUserImage()
    func showIDimagePicker ()
    func showvhicleImagepicker ()
    func showDrivingLicence()
    func makeBtnRoundCorners()
    func ComplateData(msg:String)
 
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccessMsg (msg : String)
    func hideSubmitBtn ()
   
    func featshData ( dtaa : ProfileData)
   
    func showEditIDImagesBtn()
    func hideEditIDImagesBtn()
    func ShowEditVhicleBtn()
    func hideEditVhicleBtn()
    func showEditLicenseBtn()
    func hideEditLicenseBtn()
    func gotoEditPasswordScreen()
    
    
    
    func setEmail( email : String)
 
   
    
   
 
    
    
}






class personalInfoVcPresenter {
    private weak var view : personalinfoView?
    
    
    init (view : personalinfoView) {
        self.view = view
    }
    
  
    
    
    func viewDidLoad() {
        self.view?.MakeImageRoundeed()
        self.view?.hideEditIDImagesBtn()
        self.view?.hideEditVhicleBtn()
        self.view?.hideEditLicenseBtn()
        self.view?.makeBtnRoundCorners()
        self.view?.hideSubmitBtn()
        
        self.getUserDataData()
        
     
    }
    func editUserImage() {
        view?.editUserImage()
    }
    func showIDImagePicker () {
        view?.showIDimagePicker()
    }
    func showvhicleImagePicker () {
        view?.showvhicleImagepicker()
    }
    func DrivingLicensePicker () {
        view?.showDrivingLicence()
    }
   
    func showEditIDImagesBtn(){
        self.view?.showEditIDImagesBtn()
    }
    
    func hideEditIDImagesBtn() {
        self.view?.hideEditIDImagesBtn()
    }
    func ShowEditVhicleBtn(){
        self.view?.ShowEditVhicleBtn()
    }
    func hideEditVhicleBtn(){
        self.view?.hideEditVhicleBtn()
    }
    func showEditLicenseBtn(){
        self.view?.showEditLicenseBtn()
    }
    func hideEditLicenseBtn(){
        self.view?.hideEditLicenseBtn()
    }
    func GoToEditPassword() {
        view?.gotoEditPasswordScreen()
    }
  

    func getUserDataData(){
        view?.showIndicator()
        TabBarinteractor.profile.send(profileModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
               
            self.view?.featshData(dtaa: value.data)
                
              
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    func UpdateUserData( fname: String, lname: String, email: String,phone:String,image:[UploadData]){
        
        
        view?.showIndicator()
        TabBarinteractor.UpdateProfile(fname: fname, lname: lname, email: email, phone: phone).send(AuthResponse.self, data: image,  completion: {
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):

                print("failure\(String(describing: error))")
            case .success(let value):
                User.currentUser = value.data
                self.view?.showSuccessMsg(msg: "The data has been modified successfully".localized)
            
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        })
    }

    func CheackData(fname: String, lname: String, email: String,  phone:String,image:[UploadData]){
        if(fname == "" || lname == "" ||  email == "" || phone == ""){
            self.view?.ComplateData(msg: "Please complete the data".localized)
        }else{
            self.UpdateUserData(fname: fname, lname: lname, email: email, phone: phone, image: image)
    }
    }
    
   
    
    
}
