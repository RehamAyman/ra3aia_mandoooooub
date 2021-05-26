//
//  TopRight+LeftCorners.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/23/21.
//

import UIKit
extension UIButton {
    
    
    func AddTOPCorners (num : CGFloat ) {
            
      layer.cornerRadius = num
      layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
         
    }
    
    
  
}
