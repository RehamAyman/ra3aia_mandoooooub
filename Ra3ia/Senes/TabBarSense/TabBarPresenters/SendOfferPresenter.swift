//
//  SendOfferPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation
protocol sendOfferView : class {
    func goSelectDate()
    func GoselectTime()
    func MakeBtnRound()
    func hideIndicator()
    func showSuccessMessage(msg:String )
    func showIndicator()
    func gotoHome()
    func showError(error: String )
    
    
}

class sendOfferPresenter {
    
    private weak var view : sendOfferView?
    
    init(view : sendOfferView) {
        self.view = view
    }
   
    func gotoSeelectData() {
        self.view?.goSelectDate()
    }
    
    func gotoSelectTime () {
        self.view?.GoselectTime()
    }
   
    func viewDidLoad () {
        self.view?.MakeBtnRound()
    }
    
    func sendOffer(id : String , commonPrice : String , privatePrice : String , time : String , date : String , notes : String){
        view?.showIndicator()
        TabBarinteractor.sendOffer(id: id, privatePrice: privatePrice, commonPrice: commonPrice, date: date, time: time , notes: notes).send(DefaultResponse.self){
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
                self.view?.gotoHome()
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
}
