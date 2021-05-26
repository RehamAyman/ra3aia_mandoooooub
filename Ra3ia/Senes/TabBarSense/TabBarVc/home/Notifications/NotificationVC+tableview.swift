//
//  NotificationVC+tableview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import UIKit
extension notificationsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! notificationCell
        
  //TODO: -   note : API ISSUE
        
        // if user accept the offer
        if indexPath.row == 0 {
            presenter.configAcceptedNotifi(cell: cell)
            
            
            // if user reject rhe offer and accept another delivery offer
        } else if indexPath.row == 1 {
            presenter.configureUserAcceptAnotherOffer(cell: cell)
            
            // if user just reject the offer with no reason
        } else if indexPath.row == 2 {
            presenter.configRejectedNotifi(cell: cell)
        }
        
        
        
        
        
        return cell
        
        
    }
  
    
    
    
    

    
    
}
