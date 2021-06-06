//
//  OrdersPresenter.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/19/21.
//

import Foundation
import Alamofire
//MARK:-  protocols

protocol DeliveryRegView : class{
    func FetchData()
    func setUptable()
    func gotoShipmentDetails(id : String)
    func goToClincShipmentDetails(id : String)
    func gotoNotification()
    func gotoConversations()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showNoDataImage ()
    func animation()
   
    
}


//same orders cells



class DeliveryReqVCPresenter{
    
    //MARK:- 1 vars
    
    private weak var view : DeliveryRegView?
    // note : replace with api arrays

   
    
    var requests = [requestsData]()
    var requestsModell = [requstsModel]()
    
    
    

    //MARK:- 2 view initionalizer
    
    init(view : DeliveryRegView) {
        self.view = view
    }
    
    //MARK:- 3 class functions 
    func getCellsCount () -> Int {
       // return requests.count
        return requestsModell.count
    }
    func configure(cell: OrdersDetailsCell, for index: Int) {


        cell.SetAnimalType(AnimalType: "animal:".localized +  " " + "\(self.requestsModell[index].animal)".localized)
                           
                           
        cell.SetDate(date:"Date:".localized + " "  +  "\(self.requestsModell[index].created_at)".localized
        
        )
        cell.setFromLocation(location: "From:" + " " + "\(self.requestsModell[index].receive_address)".localized)
        cell.setToLocation(Location: "To:" + " " +  "\(self.requestsModell[index].deliver_address)".localized)
        cell.setRequestNum(num: "#" + "\(requestsModell[index].id)")
        if requestsModell[index].type == "intercity_delivery" {
            cell.configCitiesDelivery()
        } else {
            cell.ConfigOtherRequests()
        }

    }
    
    
//    func confugintercity_deliveryCells ( cell : OrdersDetailsCell) {
//     //   cell.configoddCells()
//        cell.configCitiesDelivery()
//    }
//    
//    func configelseCells ( cell : OrdersDetailsCell) {
//      //  cell.configevenCells()
//        cell.ConfigOtherRequests()
//    }
    
    
    
    func viewDidload(){
        self.view?.setUptable()
        
      
    }
 
    
    func getNumberOfcells () -> Int {
        return requestsModell.count
    }
    
    func getRequests(){
        
        view?.showIndicator()

       
         
            TabBarinteractor.delegateHome.send(requestsModel.self){
                [weak self] (response) in
                
                guard let self = self else { return }
                self.view?.hideIndicator()
                switch response {
                case .unAuthorized(_):
                    print("unAuthorized")
                case .failure(let error):
                    
                    print("failure\(String(describing: error))")
                case .success(let value):
                   
                    self.requests = value.data
                    self.view?.FetchData()
                    
                    print("--------------------------\(value.data)")
                 
                case .errorResponse(let error):
                    guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                    self.view?.showError(error: errorMessage.localizedDescription.localized)
                }
            }
        }
   
    func getReqData(lat:Double,lng:Double){
        
        
        self.requestsModell.removeAll()
        
        
        view?.showIndicator()
        
        
        
        let params:Parameters = [
            "lat":lat,
            "lng":lng
            
            
        ]
        API.GetAPIWithHeader(url:"https://raaia.4hoste.com/api/delegate-home", Parameters: params, Headers: ["Authorization":"Bearer \(KeyChain.userToken ?? "")"]) { (success, value) in
            if success{
                self.view?.hideIndicator()
                
                
                 let data = value["data"] as! [[String:Any]] 
              
                
                self.view?.FetchData()
               // self.requests = value["data"] as! [requestsData]
//                self.view?.FetchData()
                for i in data{
                    let requsetsData = requstsModel().getObject(dicc: i)
                    self.requestsModell.append(requsetsData)
                    
                    
                    
                }
                
                if(self.requestsModell.count == 0){
                    self.view?.showNoDataImage()
                   
                }else{
                    self.view?.FetchData()
                  
                }
            }
        }}
        
    
    
 
    
    func DidSelectRow (index : Int ) {
     
        // التوصيل بين المدن
        // large vc with collection
        
        if self.requestsModell[index].type == "intercity_delivery" {
        self.view?.gotoShipmentDetails(id:  self.requestsModell[index].id)
            
            print("=================intercity_delivery=====")
            print(requestsModell[index].id)
            print(self.requestsModell[index].type)
            print(self.requestsModell[index].type_)
            
            
        //if self.requestsModell[index].type == "animal_supplies"
        } else   {
      
              // مستلزمات الحيوان
            // small vc without  collection
            self.view?.goToClincShipmentDetails(id : self.requestsModell[index].id)
            
            print("====================== mostalzmat haywan aw clinic type ")
            print ("go to the second shipment details vc \(self.requestsModell[index].id)")
            print(self.requestsModell[index].type)
            print(self.requestsModell[index].type_)
        }
    }
    
    func gotoNotificationVC() {
        self.view?.gotoNotification()
    }
    
    
    func gotoConversationsScreen () {
        self.view?.gotoConversations()
        
    }
    
    
    
    }


class requstsModel{
    var  id = ""
    var receive_address = ""
    var type = ""
    var type_ = ""
    var deliver_address = ""
    var animal = ""
    var created_at = ""
    
    
    func getObject(dicc: [String: Any]) -> requstsModel {
        let dic = HandleJSON.getObject().handle(dicc: dicc)
        let model = requstsModel()
        model.id = dic["id"] as! String
        model.receive_address =  dic["receive_address"] as! String
        model.type = dic["type"] as! String
        model.type_ = dic["type_"] as! String
        model.deliver_address = dic["deliver_address"] as! String
        model.animal = dic["animal"] as! String
        model.created_at = dic["created_at"] as! String
       
        return model
        
    }
}
