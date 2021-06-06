//
//  OrdersVc+tableview.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/19/21.
//

import UIKit
extension DeliveryReqVC : UITableViewDelegate , UITableViewDataSource {
    
    
    
    
    
    //MARK: - tableView Methodes
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersDetailsCell", for: indexPath) as! OrdersDetailsCell
        
       
       
        
        presenter.configure(cell: cell, for: indexPath.row)
        

          
        
        
        
        
     return cell
        
        
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.DidSelectRow(index: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCellsCount()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
  
   
}
