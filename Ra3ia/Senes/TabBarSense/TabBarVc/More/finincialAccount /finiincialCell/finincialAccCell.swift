//
//  finincialAccCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class finincialAccCell: UITableViewCell , FinancialCellsView{
    //outlets
    @IBOutlet weak var requestNumber: UILabel!
    @IBOutlet weak var appCommission: UILabel!
    @IBOutlet weak var stellmentBOutlet: UIButton!
    @IBOutlet weak var cost: UILabel!
    
    
    
    func displayOrderNumber(ordernum: String) {
        self.requestNumber.text = ordernum
    }
    
    func displayCommsion(com: String) {
        self.appCommission.text = com
    }
    
    func displayPrice(price: String) {
        self.cost.text = price + "S.R".localized
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

    }
    
    

    @IBAction func stellmentButton(_ sender: UIButton) {
        
    }
    
    
}
