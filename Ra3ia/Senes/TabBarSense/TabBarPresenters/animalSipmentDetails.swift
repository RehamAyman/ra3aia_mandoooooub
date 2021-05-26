//
//  animalSipmentDetails.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/12/21.
//

import Foundation
protocol AnimalshipmentDetailsView : class {
    
    
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess( dataa  : ShipmentData)
    func showError(error: String )
    func showSuccessMessage ( msg : String)
    func changeAcceptButtons ()
    func setUpViews ()
    func ChangeButtonsWhenStartTap()
    func changeBtWhnGoToClinic()
    func changeBtnWhenrechedClinic()
    func changeBtnWhenFinishedAtClinic()
    func changeBtnWhenGoBackTapped()
    func changeBtnWhenBackToclient()
    func BackToHome()
  
   
    
    
}






class AnimalShipmentPresenter  {
    private weak var view : AnimalshipmentDetailsView?
   
    
    
    init(view : AnimalshipmentDetailsView) {
        self.view = view
    }
    
  
    func viewDidLoad () {
        self.view?.setUpViews()
    }
    
  
  
  
    
    func getShipmentModel(id:Int){
        view?.showIndicator()
        TabBarinteractor.ShipmentDetails(id: id).send(ShipmentDetailsModel.self){
            [weak self] (response) in
          
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                self.view?.fetchingDataSuccess(dataa: value.data)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    ////////////////////////////------------------------------------ still testing
    
    // accept
    
    func sendAcceptOrder(id : Int){
        view?.showIndicator()
        TabBarinteractor.acceptOrder(id: id).send(DefaultResponse.self){
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
                
                self.view?.changeAcceptButtons()
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    // change order
    
    
    func sendChangeOrder(id : String , status : String ){
        view?.showIndicator()
        TabBarinteractor.changeOrderStatus(id: id, status: status).send(DefaultResponse.self){
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
               
                
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    func sendFinishOrder(id : String ){
        view?.showIndicator()
        TabBarinteractor.finishOrder(id: id).send(DefaultResponse.self){
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
                
                self.view?.BackToHome()
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
}
