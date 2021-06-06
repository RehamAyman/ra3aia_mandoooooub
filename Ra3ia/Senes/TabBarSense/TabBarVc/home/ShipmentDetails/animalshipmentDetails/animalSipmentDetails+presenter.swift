//
//  animalSipmentDetails+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/12/21.
//

import Foundation
import SKActivityIndicatorView

extension animalShipmentDetails : AnimalshipmentDetailsView {
  
    
  
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func fetchingDataSuccess(dataa: ShipmentData) {
        
        
        self.userName.text = dataa.user_name
        self.animalType.text = dataa.animal
        self.clinicName.text = dataa.place_name
        self.customerLocation.text = dataa.deliver_address
        self.phone.text = dataa.user_phone
        self.clinicAddress.text = dataa.receive_address
        self.cost.text = dataa.delivery_price
        if dataa.go_to_service_center_now == "true" {
            
            self.orderStatus.text = "deliver Now".localized

        }
       
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccessMessage(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    func changeAcceptButtons() {
        self.acceptStack.isHidden = true
      //  self.startStack.isHidden = false
       // self.backOutlet.isHidden = true
        self.BackToHome()
        // back to home
        
        
        
    }
    func setUpViews() {
      
       
        self.startStack.AddTOPCornersView(num: 30)
        self.retchedCustomerOutlet.AddTOPCornersView(num: 25)
        self.goToClinicOutlet.AddTOPCornersView(num: 25)
        self.rechedClinicOutlet.AddTOPCorners(num: 25)
        self.goBackOutlet.AddTOPCorners(num: 25)
        self.finishedAtClinicOutlet.AddTOPCorners(num: 25)
        self.rechedBackClient.AddTOPCorners(num: 25)
        self.finishOrder.AddTOPCorners(num: 25)
        
        
        
        self.acceptStack.isHidden = true
        self.startStack.maskToBounds = true
        self.startStack.isHidden = true
        self.retchedCustomerOutlet.isHidden = true
        self.goToClinicOutlet.isHidden = true
        self.rechedClinicOutlet.isHidden = true
        self.goBackOutlet.isHidden = true
        self.finishedAtClinicOutlet.isHidden = true
        self.rechedBackClient.isHidden = true
        self.finishOrder.isHidden = true
        
        
        
        if isOrderSelected == true {
                   // come from my order ( current )
                   self.acceptStack.isHidden = true
                   self.startStack.isHidden = false
                   
        } else if completedOrderSelected == true {
            // comefrom my order ( completed )
            self.acceptStack.isHidden = true
            self.startStack.isHidden = true
        }
                
           
       else if isHomeSelected == true {
                   // come from home
                   self.acceptStack.isHidden = false
                   self.startStack.isHidden = true
               }
    }
    
    func ChangeButtonsWhenStartTap() {
        self.startStack.isHidden = true
        self.retchedCustomerOutlet.isHidden = false
    }
    func changeBtWhnReachCustomerTap() {
        self.retchedCustomerOutlet.isHidden = true
        self.goToClinicOutlet.isHidden = false
    }
    func changeBtWhnGoToClinic() {
        self.goToClinicOutlet.isHidden = true
        self.rechedClinicOutlet.isHidden = false
    }
    func changeBtnWhenrechedClinic() {
        self.rechedClinicOutlet.isHidden = true
        self.finishedAtClinicOutlet.isHidden = false
    }
  
    func changeBtnWhenFinishedAtClinic() {
        self.finishedAtClinicOutlet.isHidden = true
        self.goBackOutlet.isHidden = false
    }
   
    func changeBtnWhenGoBackTapped() {
        self.goBackOutlet.isHidden = true
        self.rechedBackClient.isHidden = false
          
      }
    func changeBtnWhenBackToclient() {
        self.rechedBackClient.isHidden = true
        self.finishOrder.isHidden = false
           
        
    }
    func BackToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
            
                window.rootViewController = Vc
            }
    }

}
