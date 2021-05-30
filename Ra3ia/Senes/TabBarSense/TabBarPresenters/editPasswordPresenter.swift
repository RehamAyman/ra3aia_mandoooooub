//
//  editPasswordPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/30/21.
//

import Foundation
import Foundation
// protocols

protocol editPasswordView : class {
    func makeRoundBtn()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccess(msg:String)
    func BackHome()
    
}


class editPasswordPresenter {
    
    //MARK:- 1 variabals
    private weak var view : editPasswordView?
    var utils = AppUtils()
    
    
    //MARK:- 2 view initionalizer
    init(view : editPasswordView) {
        self.view = view
    }
    func viewDidLoad(){
        self.view?.makeRoundBtn()

    }
    
  
    func editPassword (currentPassword :String , NewPassword : String  ){
        view?.showIndicator()
        
        
        // update password
        
        TabBarinteractor.updatePassword(current_password: currentPassword, password: NewPassword).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                if(value.code == 200 ){
                   
                    self.view?.showSuccess(msg: value.msg?.localized() ?? "" )
                      self.view?.BackHome()
                
                }else{
                    self.view?.showError(error: value.msg?.localized() ?? "" )
                    
                    
                    
                }
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }
    
    func cheackValidData(currentPassword :String , newPassword : String  , confirmNewPassword : String) {
        if( newPassword != "" || currentPassword != "" || confirmNewPassword != ""  ){
            
            if ( currentPassword == newPassword  ) {
                
                showWarningAlert(title: "", message: "you enterd same current and new password  ".localized())
                
            } else if (newPassword != confirmNewPassword){
                showWarningAlert(title: "", message: "Password and confirm password must be match!" .localized())
            }
            
            
            else {
                
                self.editPassword(currentPassword: currentPassword, NewPassword: newPassword)
            }
            
        }else{
          
            completData(title: "", message: "a required field has been left Blank ".localized)
        }
        
    }
  

    
    
    
}
