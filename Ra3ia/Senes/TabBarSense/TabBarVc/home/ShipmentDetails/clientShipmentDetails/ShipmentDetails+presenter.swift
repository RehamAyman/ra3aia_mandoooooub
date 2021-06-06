//
//  ShipmentDetails+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation
import SKActivityIndicatorView

extension ShipmentdetailsVC : shipmentDetailsView {
    func gotoWithdrawalVC() {
        let vc = Storyboard.Main.viewController(withdrawalResoneVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpViews() {
        self.startStack.AddTOPCornersView(num: 25)
        self.rechedRecAdd.AddTOPCorners(num: 25)
        self.packageRecieved.AddTOPCorners(num: 25)
        self.goBack.AddTOPCorners(num: 25)
        self.rechedBackClient.AddTOPCorners(num: 25)
        self.finishOrder.AddTOPCorners(num: 25)
        
        
        self.startStack.isHidden = true
        self.acceptStack.isHidden = true
        self.rechedRecAdd.isHidden = true
        self.packageRecieved.isHidden = true
        self.goBack.isHidden = true
        self.rechedBackClient.isHidden = true
        self.finishOrder.isHidden = true
        
        
        
        // when come from home
        if isComeFromHome == true {
            acceptStack.isHidden = false
            
            
         // when come from current order
        } else if isOrderSelected == true {
          
            self.startStack.isHidden = false
            
            
           // when come from completed order
        } else if isComeFromCompletedOrder == true {
        
            
           
        }
        
        
        
        
    }
    
    func ChangeButtonsWhenStartTap() {
        self.backOutlet.isHidden = true
        self.startStack.isHidden = true
        self.rechedRecAdd.isHidden = false
        
    }
    
    func changeButtonsWhenRechRecAdd() {
        self.rechedRecAdd.isHidden = true
        self.packageRecieved.isHidden = false
    }
    
    func changeBtnsWhenPackageRec() {
        self.packageRecieved.isHidden = true
        self.goBack.isHidden = false
    }
    func changeBtnsWhenGoBack() {
        self.goBack.isHidden = true
        self.rechedBackClient.isHidden = false
    }
    func changeBtnsWhenRechedBackClient() {
        self.rechedBackClient.isHidden = true
        self.finishOrder.isHidden = false
    }
    
    
    
    func featchData() {
        self.Collectionview.reloadData()
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    func showSuccessMessage(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
   
    func setupCollection() {
        Collectionview.delegate = self
        Collectionview.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            let width = UIScreen.main.bounds.width
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: width / 2, height: width / 2)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            Collectionview!.collectionViewLayout = layout
        
        
    }
    
    
    
    func fetchingDataSuccess(dataa: ShipmentData) {
     //   self.id = "\(dataa.id)"
        
        self.customerName.text = dataa.user_name
        self.animalType.text = dataa.animal
        self.deleiveringLoca.text = dataa.deliver_address
        self.resieveLoca.text = dataa.receive_address
        self.paymentMethod.text = dataa.payment_type_
        self.streetName.text = dataa.place_name
        self.shipmentDetails.text = dataa.desc
        
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func gotoAddOfferVc() {
        let vc = Storyboard.Main.viewController(sendOfferVC.self)
        vc.id = self.id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func backToHome() {
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
                guard let window = UIApplication.shared.keyWindow else { return }
                
                let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
                
                    window.rootViewController = Vc
                }
        
    }
    
}
