//
//  finincialAccount+presenterDelegates.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation
import SKActivityIndicatorView
import ViewAnimator
import SafariServices


extension finincialAccountVC : finincialAccView , SFSafariViewControllerDelegate {
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
        self.SetAllurl = FininalAccountData.payment_url
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
        let vc = Storyboard.Main.viewController(selectPaymentMethodVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    func openSetallUrl() {
        if let url = URL(string: SetAllurl) {
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                vc.delegate = self
                present(vc, animated: true)
            }
    }
}
