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
  
    
    


    
}
