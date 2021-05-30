//
//  bankingAccounts+TableView.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit
extension bankAccountsVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getbanksCount()
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "bankAccountCell", for: indexPath) as! bankAccountCell
       presenter.configureBankCells(cell: cell, for: indexPath.row)
        cell.delteAction = {
            self.presenter.deleteLoctionAction(index: indexPath.row)
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
