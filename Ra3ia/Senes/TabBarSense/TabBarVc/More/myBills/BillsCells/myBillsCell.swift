//
//  myBillsCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class myBillsCell: UITableViewCell , MyBillsCellView {
    
    //outlets
    @IBOutlet weak var requestNum: UILabel!
    
    @IBOutlet weak var requestCost: UILabel!
    @IBOutlet weak var requestType: UILabel!
    
    @IBOutlet weak var requestDate: UILabel!
    
    func setRequestNumber(num: Int) {
        self.requestNum.text = "request num:".localized() + String(num)
    }
    
    func setRequestTpee(type: String) {
        self.requestType.text = type
    }
    
    func setDateOfRequest(date: String) {
        self.requestDate.text = date
    }
    
    func setCostOfRequest(cost: String) {
        self.requestCost.text = cost
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
    }

 

}
