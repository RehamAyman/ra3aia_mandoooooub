//
//  messageVc+tableview.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/12/21.
//

import UIKit
extension messageVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! messageCell
        
        
//
//        if messageText.text?.isEmpty == false{
//        cell.messageLabel.text = messageText.text
//        }
//        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
