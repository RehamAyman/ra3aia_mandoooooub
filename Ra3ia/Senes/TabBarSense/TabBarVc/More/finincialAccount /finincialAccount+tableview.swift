//
//  finincialAccount+tableview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

extension finincialAccountVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getCellsCount()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "finincialAccCell", for: indexPath) as! finincialAccCell
      presenter.ConfigerCell(cell: cell, index: indexPath.row)
        
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}
