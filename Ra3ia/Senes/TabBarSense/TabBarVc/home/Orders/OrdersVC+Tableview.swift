//
//  OrdersVC+Tableview.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/20/21.
//

import UIKit
extension OrdersVC : UITableViewDelegate , UITableViewDataSource {
    
    
    
    //MARK: - tableView setup
    
    func setupTableView() {

        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.register(UINib(nibName:"OrdersDetailsCell" , bundle: nil), forCellReuseIdentifier: "OrdersDetailsCell")

    }
    
  
    //MARK: - tableView Methodes
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersDetailsCell", for: indexPath) as! OrdersDetailsCell
        
        if SegmentOutlet.selectedSegmentIndex == 0 {
            
            presenter.configureCurrentReqCells(cell: cell, for: indexPath.row)
            
        }else if SegmentOutlet.selectedSegmentIndex == 1 {
            
            presenter.configCompletedcells(cell: cell, for: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if SegmentOutlet.selectedSegmentIndex == 0 {
            self.presenter.didSelectRow(index: indexPath.row, type: "current")
        } else {
            self.presenter.didSelectRow(index: indexPath.row, type: "completed")

        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SegmentOutlet.selectedSegmentIndex == 0 {
            
            
            return presenter.getcurrentReqCellsCount()
        }else {
         
            return presenter.getCompletdReqCellsCount()
           
        }
       
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125
    }

   
}
