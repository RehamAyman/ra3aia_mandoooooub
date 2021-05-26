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
