//
//  notificati.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import Foundation
extension notificationsVC : NotificationsView {
    func fetchingData() {
        self.tableview.reloadData()
    }
    
    func setUpTable() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    
    
    
}
