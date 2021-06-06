//
//  OrdersVcPresenter.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/20/21.
//

import Foundation

protocol OrdersView: class {
    
    func FetchData()
    func gotoNotifications()
    func showIndicator()
    func hideIndicator()
    func showError(error: String )
//    func selectOrderDetils(id : Int)
//    func gotoShipmentDetails(id: Int )
//    func goToClincShipmentDetails(id : Int )
    
    
  func goToShipment(id: Int )
    func goToCLinicSHipment( id : Int)
 
}

protocol OrdersCellsView  {
    
func setToLocation ( Location : String)
func setFromLocation (location : String)
func SetDate ( date : String)
func SetAnimalType ( AnimalType : String)
    func setRequestNum ( num : String)
    
    
    

    func configCitiesDelivery()
    func ConfigOtherRequests()

}



//MARK:- presenter class


class OrdersVCPresenter{
    //MARK:- 1 vars
    
    // replace string arrays with arrays comes from api
    var currentRequestsArray = [Active_orders]()
    var completedOrdersArray = [Finished_orders]()
 
    
    private weak var view: OrdersView?
    
    //MARK:- 2 view initionalizer
    
    init(view: OrdersView) {
        self.view = view
    }
    
    //MARK:- 3 class functions
    func getcurrentReqCellsCount() -> Int {
        return currentRequestsArray.count
    }
    func getCompletdReqCellsCount() -> Int {
        return completedOrdersArray.count
    }
    func viewWillApper(){
        self.currentRequestsArray.removeAll()
        self.completedOrdersArray.removeAll()
        self.view?.FetchData()
        self.getOrders()
        
    }
    
    
    func configureCurrentReqCells(cell: OrdersDetailsCell , for index: Int) {
        
        cell.SetAnimalType(AnimalType: "animal:".localized + " " + "\(currentRequestsArray[index].animal)".localized)
                           cell.SetDate(date: "Date:".localized + " " + "\(currentRequestsArray[index].created_at)".localized)
        cell.setFromLocation(location: "From:" + " " + "\(currentRequestsArray[index].receive_address)".localized)
        cell.setToLocation(Location: "To:".localized + "\(currentRequestsArray[index].deliver_address)".localized)
        
        
        cell.setRequestNum(num: "#" + "\(currentRequestsArray[index].id)"  )
        if currentRequestsArray[index].type == "intercity_delivery" {
            cell.configCitiesDelivery()
        } else {
            cell.ConfigOtherRequests()
        }
      
    }
    func configCompletedcells( cell : OrdersDetailsCell , for index : Int) {
        cell.SetAnimalType(AnimalType: "Animal:".localized + " " + "\(completedOrdersArray[index].animal)".localized)
        cell.setFromLocation(location: "From:".localized + " " + "\(completedOrdersArray[index].receive_address)".localized)
        cell.setToLocation(Location: "To:" + " " + "\(completedOrdersArray[index].deliver_address)".localized)
        cell.SetDate(date: "Date:".localized + " " + "\(completedOrdersArray[index].created_at)".localized)
        cell.setRequestNum(num: "#\(completedOrdersArray[index].id)")
        
        if completedOrdersArray[index].type == "intercity_delivery" {
            cell.configCitiesDelivery()
        } else {
            cell.ConfigOtherRequests()
        }
    }
    
    
    func gotoNotificationScreen () {
        self.view?.gotoNotifications()
        
    }
    
   
    func getOrders(){
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
                print(value)
                
                self.completedOrdersArray = value.data.finished_orders
                self.currentRequestsArray = value.data.active_orders
                self.view?.FetchData()


            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    func didSelectRow(index:Int,type:String){
        if  type == "current" && currentRequestsArray[index].type == "intercity_delivery" {
            self.view?.goToShipment(id: self.currentRequestsArray[index].id)
        } else if   type == "completed" && completedOrdersArray[index].type == "intercity_delivery" {
            self.view?.goToShipment(id: self.completedOrdersArray[index].id)
            
        } else if  (type == "completed") {
            self.view?.goToCLinicSHipment(id: completedOrdersArray[index].id)
        } else if type == "current" {
            
            self.view?.goToCLinicSHipment(id: currentRequestsArray[index].id)
        }
        
        
        
        
       
        
    }
//    func DidSelectRowCurrent (index : Int ) {
//
//        // التوصيل بين المدن
//        // large vc with collection
//
//        if self.currentRequestsArray[index].type == "intercity_delivery" {
//        self.view?.gotoShipmentDetails(id:  self.currentRequestsArray[index].id)
//
//
//        }  else  {
//
//              // مستلزمات الحيوان
//            // small vc without  collection
//            self.view?.goToClincShipmentDetails(id : self.currentRequestsArray[index].id)
//
//
//        }
//    }
//
//
//    func DidSelectRowCompleted (index : Int ) {
//
//        // التوصيل بين المدن
//        // large vc with collection
//
//        if self.completedOrdersArray[index].type == "intercity_delivery" {
//        self.view?.gotoShipmentDetails(id:  self.completedOrdersArray[index].id)
//
//
//
//
//
//        } else   {
//
//              // مستلزمات الحيوان
//            // small vc without  collection
//            self.view?.goToClincShipmentDetails(id : self.completedOrdersArray[index].id)
//
//
//        }
//    }
    
}
