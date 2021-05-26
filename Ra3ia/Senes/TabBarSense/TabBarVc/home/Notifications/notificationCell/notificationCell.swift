//
//  notificationCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import UIKit

class notificationCell: UITableViewCell , NotificationCellView{
  
    

    @IBOutlet weak var notificationLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    

    func configuerRejectedNotifi() {
        notificationLabel.textColor = .black
        contentView.backgroundColor = .systemGray5
      }
      
      func configureAcceptedNotifi() {
        notificationLabel.textColor = UIColor(named: "BaseColour")
        contentView.backgroundColor = #colorLiteral(red: 0.9476155863, green: 0.944330952, blue: 0.9156681876, alpha: 1)
      }
      
      func configureUserAcceptAnotherOffer() {
          
        notificationLabel.textColor = .red
        contentView.backgroundColor = .white

        
      }

    
    

}
