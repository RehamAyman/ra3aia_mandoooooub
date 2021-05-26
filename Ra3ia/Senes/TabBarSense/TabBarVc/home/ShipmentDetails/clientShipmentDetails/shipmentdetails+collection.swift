//
//  shipmentdetails+collection.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/11/21.
//

import Foundation
import UIKit


extension ShipmentdetailsVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getCellsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: "shipmentImageCell", for: indexPath) as! shipmentImageCell
        presenter.configshipmentImgCells(cell: cell, for: indexPath.row)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Collectionview.frame.width / 4
                      , height: Collectionview.frame.height - 10 )
    }
   
    
    
}
