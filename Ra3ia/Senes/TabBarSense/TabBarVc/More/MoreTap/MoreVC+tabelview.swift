//
//  MoreVC+tabelview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/21/21.
//

import UIKit
extension MoreVC : UITableViewDelegate , UITableViewDataSource {
    
    
   
    
    
    
    //MARK: - tableview delegate methods
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getcellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "MoreSettingCell", for: indexPath) as! MoreSettingCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.DidSelectRow(index: indexPath.row)
        
    }}
