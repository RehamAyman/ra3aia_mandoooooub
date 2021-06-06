//
//  NotificationVC+tableview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import UIKit
extension notificationsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presnter.getcellsCount()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! notificationCell
        presnter.configureRecipesCells(cell: cell, for: indexPath.row)
        
  //TODO: -   note : API ISSUE
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.systemGray6
            
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.8728941083, green: 0.7903078794, blue: 0.6347703934, alpha: 1)
        }
        
        // if user accept the offer
        
            
            
            // if user reject rhe offer and accept another delivery offer
       
            
            // if user just reject the offer with no reason
    
        
        
        
        
        return cell
        
        
    }
  
    
    
    
    

    
    
}
