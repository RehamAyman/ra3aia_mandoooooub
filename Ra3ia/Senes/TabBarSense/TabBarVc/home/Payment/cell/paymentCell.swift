//
//  paymentCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/5/21.
//

import UIKit

class PaymentMethodCellTableViewCell: UITableViewCell ,configerPayemntMethod{
    func showNAme(name: String) {
        self.paymentName.text = name
    }
    
   

    @IBOutlet weak var paymentName: UILabel!
    @IBOutlet weak var paymentType: UIImageView!
    
    func showImage(imge: String) {
        self.paymentType.image = UIImage(named: imge)
    }
    

    
    

}

