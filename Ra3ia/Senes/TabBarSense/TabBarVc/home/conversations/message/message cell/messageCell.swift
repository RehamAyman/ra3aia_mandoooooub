//
//  messageCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/12/21.
//

import UIKit

class messageCell: UITableViewCell , messageCellView{
    
    

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        makeMsgViewCurves()
       
    }

    func makeMsgViewCurves() {
        messageView.layer.cornerRadius = 20
        messageView.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner , .layerMinXMaxYCorner ]
        
        // .layerMinXMinYCorner
    }

}
