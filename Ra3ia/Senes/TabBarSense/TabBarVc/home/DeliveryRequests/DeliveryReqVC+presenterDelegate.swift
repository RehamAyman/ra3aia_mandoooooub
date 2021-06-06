//
//  DeliveryReqVC+presenterDelegate.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/21/21.
//

import UIKit
import SKActivityIndicatorView
import ViewAnimator


extension DeliveryReqVC : DeliveryRegView {
    // small one
    func goToClincShipmentDetails(id: String) {
        let vc = Storyboard.Main.viewController(animalShipmentDetails.self)
        vc.id = id
        
        vc.isHomeSelected = true
        vc.isOrderSelected = false
        vc.completedOrderSelected = false
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func animation() {
        
    }
    
    func showNoDataImage() {
        
    }
    
    func gotoShipmentDetails(id: String) {
        // el twseel ben el modon details
         let vc = Storyboard.Main.viewController(ShipmentdetailsVC.self)
           vc.id = id
        vc.isOrderSelected = false
        vc.isComeFromHome = true
        vc.isComeFromCompletedOrder = false
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    
    
    func FetchData() {
        self.tableview.reloadData()
        let ANIMATION = AnimationType.zoom(scale: 0.2)
        UIView.animate(views: tableview.visibleCells, animations: [ANIMATION], duration: 0.6 )
    }
    
    
    func setUptable() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName:"OrdersDetailsCell" , bundle: nil), forCellReuseIdentifier: "OrdersDetailsCell")
    }
//    func animateView() {
//        let ANIMATION = AnimationType.zoom(scale: 0.2)
//        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
//        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation, ANIMATION], duration: 0.8 )
//
//    }
   
    func gotoNotification() {
        let vc = Storyboard.Main.viewController(notificationsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func gotoConversations() {
        
        let vc = Storyboard.Main.viewController(conversationsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
         
    }
    
    
    
    
}
    
