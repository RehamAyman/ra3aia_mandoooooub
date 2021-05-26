//
//  myBills+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation
import SKActivityIndicatorView

extension myBillsVC : MyBillsView {
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
    }
    
    func setUpTable() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    
    
    
}
