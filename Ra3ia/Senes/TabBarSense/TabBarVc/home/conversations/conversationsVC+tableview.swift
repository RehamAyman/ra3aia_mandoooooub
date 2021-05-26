//
//  conversationsVC+tableview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/8/21.
//

import UIKit
extension conversationsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRoomsCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationCell
        
        presenter.configureROOMSCells(cell: cell, for: indexPath.row)
     
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.DidSelectRow(index: indexPath.row)
    }
    
    
    
    
}
