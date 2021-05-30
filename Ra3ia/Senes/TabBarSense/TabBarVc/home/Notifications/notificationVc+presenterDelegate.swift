//
//  notificati.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import Foundation
import SKActivityIndicatorView



extension notificationsVC : NotificatonView {
    func fetchingDataSuccess() {
        self.tableview.reloadData()
    }
    
    func SetUpTableview() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
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
    
    func DidSelct(id: Int) {
        print("did select")
    }
    
//    func fetchingData() {
//        self.tableview.reloadData()
//    }
//
//    func setUpTable() {
//        tableview.delegate = self
//        tableview.dataSource = self
//        tableview.separatorStyle = .none
//    }
    
    
    
}
