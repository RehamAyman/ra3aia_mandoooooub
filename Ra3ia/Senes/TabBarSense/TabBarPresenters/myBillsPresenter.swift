//
//  myBillsPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation
 // protocols
 

protocol MyBillsView : class  {
    func setUpTable ()
    func showIndicator()
    func hideIndicator()
    func showError(error: String )
    func featchingData ()
}


protocol MyBillsCellView {
    func setRequestNumber (num : Int )
    func setRequestTpee (type : String )
    func setDateOfRequest ( date : String)
    func setCostOfRequest ( cost : String)
    
    
}


// class


class MyBillsPresenter {
    
    private weak var view : MyBillsView?
    private var billsArray = [Finished_orders]()
    
    
    init(view : MyBillsView ) {
        self.view = view
    }
    
    func viewDidLoad () {
        self.view?.setUpTable()
        self.billsArray.removeAll()
        self.view?.featchingData()
        self.getBillsData()
        
        
            
        
    }
    
    
    func configureBillsCells(cell: MyBillsCellView , for index: Int) {
        cell.setRequestTpee(type: billsArray[index].type_.localized)
        cell.setDateOfRequest(date: billsArray[index].created_at.localized)
        cell.setRequestNumber(num: billsArray[index].id)
        cell.setCostOfRequest(cost: "//")
        
    
      
    }
    
    func getCellsCount () -> Int {
        return billsArray.count
    }
    
    func getBillsData(){
        view?.showIndicator()
        TabBarinteractor.orders.send(ordersModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                self.billsArray = value.data.finished_orders
                
                self.view?.featchingData()
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
}
