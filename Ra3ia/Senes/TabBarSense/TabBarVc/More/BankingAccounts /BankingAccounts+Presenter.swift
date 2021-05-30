//
//  BankingAccounts+Presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation
import SKActivityIndicatorView
import ViewAnimator

extension bankAccountsVC : bankingAccountView {
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func featchingData() {
        self.tableview.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 50 , dy: 0))

        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.5 )
    }
    
    func gotoAddNewBankAcc() {
        let vc = Storyboard.Main.viewController(addNewBankAccVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func RoundBtnTopCorners() {
        self.AddOutlet.AddTOPCorners(num: 25)
        
    }
    
    func setUpTable() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
       
    }
  
    
    func showSuccessMessge(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }

    func ShowAlert(id: Int) {
        let alert = UIAlertController()
        alert.customAlert(title: "Delete".localized(), message:"Are you sure you want to delete this bank?".localized() )
//        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 250)
//        alert.view.addConstraint(height);
        
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: { action in
            self.presenter.deleteBank(id: id)
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
