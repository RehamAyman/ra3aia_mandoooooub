//
//  myBills+tableViewDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit


extension myBillsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "myBillsCell", for: indexPath) as! myBillsCell
        presenter.configureBillsCells(cell: cell, for: indexPath.row)
        
        return cell
    }
     
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
}
