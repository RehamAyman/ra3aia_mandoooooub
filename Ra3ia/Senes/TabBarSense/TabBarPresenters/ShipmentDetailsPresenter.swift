//
//  ShipmentDetailsPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation

protocol shipmentDetailsView : class {
    
    func gotoAddOfferVc ()
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess( dataa  : ShipmentData)
    func showError(error: String )
    func showSuccessMessage ( msg : String)
    func featchData()
    func setupCollection ()
    
    
}




protocol shipmentCellView  {
        func setShipmentImage ( image : String)
}



class ShipmentPresenter  {
    private weak var view : shipmentDetailsView?
    private var arrrayofImeges = [ShipmentImages]()
    
    
    init(view : shipmentDetailsView) {
        self.view = view
    }
    func viewWillAppeare () {
        self.arrrayofImeges.removeAll()
        self.view?.featchData()
    }
    func viewDidLoad () {
        self.view?.setupCollection()
    }
    
    func gotoAddOfferScreen() {
        self.view?.gotoAddOfferVc()
    }
    func configshipmentImgCells(cell: shipmentImageCell, for index: Int) {
        
        cell.setShipmentImage(image: arrrayofImeges[index].name ?? "" )
      
    }
    func getCellsCount () -> Int {
        return arrrayofImeges.count
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
                
                // .....  unwrabing value
                
                self.arrrayofImeges = value.data.images!
                self.view?.featchData()
                
                
                self.view?.fetchingDataSuccess(dataa: value.data)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    //////////////////////
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
                
                self.view?.gotoAddOfferVc()
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
}
