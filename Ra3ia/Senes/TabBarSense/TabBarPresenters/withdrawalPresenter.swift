//
//  withdrawalPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/10/21.
//

import Foundation

// protocol
protocol WithdrawalReasonView : class {
    func makeTopRoundView ()
    func showIndicator()
    func hideIndicator()
    func showSuccessMessage(msg : String)
    func showError(error: String )
    func backHome()
    
    
}





class withdrawalPresenter {
    private weak var view : WithdrawalReasonView?
    init(view : WithdrawalReasonView) {
        self.view = view
    }
    
    
    
    
    
    
    // functions
    
    func viewDidload(){
        self.view?.makeTopRoundView()
        
        
    }
    func sendWithdrawal(id : String , reason : String ){
        view?.showIndicator()
        TabBarinteractor.withdrawal(id: id, reason: reason).send(DefaultResponse.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccessMessage(msg: value.msg ?? "")
                self.view?.backHome()
               
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
}
