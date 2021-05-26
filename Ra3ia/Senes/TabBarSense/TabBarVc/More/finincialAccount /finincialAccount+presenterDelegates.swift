//
//  finincialAccount+presenterDelegates.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation
import SKActivityIndicatorView
import ViewAnimator

extension finincialAccountVC : finincialAccView {
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func FeatchData(FininalAccountData: FinAccountData) {
        self.ammountToPaied.text = FininalAccountData.not_paid_commissions
        self.totalReq.text = FininalAccountData.total_delivery
        self.tableview.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.6 )
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func setUpTableview() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    
    
    func gotoSelectPayMethodVC() {
        let vc = Storyboard.Main.viewController(SelectPayMtehodVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
