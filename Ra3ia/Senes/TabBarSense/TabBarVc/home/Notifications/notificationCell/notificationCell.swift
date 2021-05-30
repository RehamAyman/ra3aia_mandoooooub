//
//  notificationCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import UIKit

class notificationCell: UITableViewCell  , NotificatonCellView  {


    @IBOutlet weak var notificationLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configuerAcceptNotification() {
          notificationLabel.textColor = UIColor(named: "BaseColour")
          contentView.backgroundColor = #colorLiteral(red: 0.844750752, green: 0.5979726525, blue: 0.3320100131, alpha: 0.2799389983)
      }
      
      func configerRejectedNotification() {
        notificationLabel.cornerRadius = 10
        notificationLabel.maskToBounds = true
          notificationLabel.textColor = .darkGray
          contentView.backgroundColor = .systemGray6
      }
    
    func configuerDefualt() {
        notificationLabel.cornerRadius = 10
        notificationLabel.maskToBounds = true
        notificationLabel.textColor = .black
        notificationLabel.backgroundColor = .systemGray5
    }
      
      func configuerAcceptOtherOfer() {
        
          notificationLabel.textColor = .red
          contentView.backgroundColor = .white
      }
    

//    func configuerRejectedNotifi() {
//        notificationLabel.textColor = .black
//        contentView.backgroundColor = .systemGray5
//      }
//
//      func configureAcceptedNotifi() {
//        notificationLabel.textColor = UIColor(named: "BaseColour")
   //     contentView.backgroundColor = #colorLiteral(red: 0.9476155863, green: 0.944330952, blue: 0.9156681876, alpha: 1)
//      }
//
//      func configureUserAcceptAnotherOffer() {
//
//        notificationLabel.textColor = .red
//        contentView.backgroundColor = .white
//
//
//      }

    
    
    
    
    
    

    func setTitle(title: String) {
        self.notificationLabel.text = title
    }
    
  
}
