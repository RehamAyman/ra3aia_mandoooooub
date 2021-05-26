//
//  RegisterByImgsPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import Foundation

// protocols

protocol registerBYimagesView : class {
  func gotoVerfication ()
    func ShowUserPicker ()
    func showIDimagePicker ()
    func showvhicleImagepicker ()
    func showDrivingLicence()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showALERT(aleert : String)
    func showMsg(msg:String)
    func shownavBar ()
    
    
    
}








class registerByImgs {
    
    //MARK:- 1 variabals
    
   private weak var view : registerBYimagesView?
    
    //MARK:- 2 view initionalizer
    
    init(view : registerBYimagesView) {
        self.view = view
    }
    //MARK: - 3 class functions
    
    func gotoVervicationScreen (){
        view?.gotoVerfication()
    }
    
    func ShowUserPicker() {
        view?.ShowUserPicker()
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
    func viewDidLoad () {
        self.view?.shownavBar()
    }
    
    
    func RegisterNewDelegate(fname:String,lname:String,email:String,phone:String,password:String,carType : String ,address : String , Images : [UploadData]) {
        view?.showIndicator()
        AuthntcationInteractor.Register(fname: fname, lname: lname, email: email, phone: phone, password: password, device_id: AppDelegate.FCMTOKEN, device_type: "ios", acc_type: "delegate", address: address, car_type: carType).send(RegisterModel.self, data: Images ,  completion: {
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                KeyChain.userToken = value.data.token
                print("success to register ")
                
                self.view?.showMsg(msg: value.msg)
                self.view?.gotoVerfication()
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        })
    }
    func cheackData(fname:String,lname:String,email:String,phone:String,password:String,address: String, carType: String ,Images:[UploadData]){
        
        if(fname == "" || lname == "" || email == "" ||  phone == "" || password == ""  || carType == "" || address == "" ) {
            self.view?.showMsg(msg: "Please complete your data".localized)
        }else{
            self.RegisterNewDelegate(fname: fname, lname: lname, email: email, phone: phone, password: password, carType: carType, address: address, Images: Images)
        }
    }
    
}

