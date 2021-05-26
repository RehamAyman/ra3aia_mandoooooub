//
//  shipmentImageCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/11/21.
//

import UIKit

class shipmentImageCell: UICollectionViewCell  , shipmentCellView
{
   
    
    
    @IBOutlet weak var shipmentImage: UIImageView!
    
    
    
    func setShipmentImage(image: String) {
        self.shipmentImage.setImageWith(image)
        
    
       }

    
}
