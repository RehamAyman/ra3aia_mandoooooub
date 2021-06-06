//
//  payment+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/5/21.
//

import Foundation
import SKActivityIndicatorView
import ViewAnimator
extension selectPaymentMethodVC :   paymenttView{
    func fetchingDataSuccess() {
        tabelView.reloadData()
    }
    
    func gotoCreditCard() {
        
    }
    
    func gotoApplePay() {
        
    }
    
    func gotoSTCpay() {
        
    }
    
    func setUpTabel() {
        tabelView.delegate = self
        tabelView.dataSource = self
    }
    
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    func showAnimated() {
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tabelView.visibleCells, animations: [fromAnimation], duration: 0.6 )
    }
    
    
 
    
  
    func showComplateData() {
        completData(title: "", message: "Please complete your Data".localized)
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
        
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
        
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
        
    }
    
    func gotoBankTransfer() {
        let vc = Storyboard.Main.viewController(paymentVC.self)
        navigationController?.pushViewController(vc, animated: true)
    }
    func FetchingData(){
        self.tabelView.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tabelView.visibleCells, animations: [fromAnimation], duration: 0.6 )
    }
    
}
