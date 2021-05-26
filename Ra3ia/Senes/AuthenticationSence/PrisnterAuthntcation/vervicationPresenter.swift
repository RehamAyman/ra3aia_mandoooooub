//
//  vervicationPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import Foundation

// protocols

protocol verificationView : class {
  
    func gotoHomePage()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccess(msg:String)
    func LoginToApplication(type:String)
    func showStatusalert (message : String)
    
}








class verificationPresenter {
    
    //MARK:- 1 variabals
    
   private weak var view : verificationView?
    var utils = AppUtils()
    
    //MARK:- 2 view initionalizer
    
    init(view : verificationView) {
        self.view = view
    }
    //MARK: - 3 class functions
    
    func VerfyPhone(v_code:String){
        view?.showIndicator()
        AuthntcationInteractor.VerfyPhone(v_code: v_code).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                if(value.code == 419){
                    self.view?.showError(error: value.msg ?? "")
                }else{
                    self.view?.showSuccess(msg: value.msg ?? "")
                    
                }
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }
    func resendCode(){
        view?.showIndicator()
        AuthntcationInteractor.resendCode.send(DefaultResponse.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                print(value)
                
                self.view?.showStatusalert(message: value.msg ?? "" )
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    func goToHomescreen () {
        view?.gotoHomePage()
    }
    
    func cheackValidData(vrefcationCode:String) {
        if(vrefcationCode != "" ){
                self.VerfyPhone(v_code: vrefcationCode)
        }else{
            completData(title: "", message: "Please enter the Vrefication Code".localized)
        }
        
    }
    
}
