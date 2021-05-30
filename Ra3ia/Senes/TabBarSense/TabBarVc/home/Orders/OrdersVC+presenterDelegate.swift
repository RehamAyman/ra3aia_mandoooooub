//
//  OrdersVC+presenterDelegate.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/20/21.
//

import UIKit
import SKActivityIndicatorView
import ViewAnimator
extension OrdersVC : OrdersView {
    func goToShipment(id: Int) {
        let vc = Storyboard.Main.viewController(ShipmentdetailsVC.self)
          vc.id = String(id)
        vc.isOrderSelected = true
       
       
       
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCLinicSHipment(id: Int) {
        let vc = Storyboard.Main.viewController(animalShipmentDetails.self)
        vc.id = String(id)
        if SegmentOutlet.selectedSegmentIndex == 0 {
            // current order
            
            
            vc.isOrderSelected = true
            vc.completedOrderSelected = false
            vc.isHomeSelected = false
        } else if SegmentOutlet.selectedSegmentIndex ==  1 {
            
            // complete order
            
            
            vc.completedOrderSelected = true
            vc.isOrderSelected = false
            vc.isHomeSelected = false
            
        }
       
        
        
        
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
        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation, ANIMATION], duration: 0.6 )
       
    }
    func gotoNotifications() {
        let vc = Storyboard.Main.viewController(notificationsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func selectOrderDetils(id: Int) {
       // go to only details screen
        
        
    }
   
    
    
    
}
