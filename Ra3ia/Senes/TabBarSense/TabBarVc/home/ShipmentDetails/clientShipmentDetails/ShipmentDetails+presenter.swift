//
//  ShipmentDetails+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation
import SKActivityIndicatorView

extension ShipmentdetailsVC : shipmentDetailsView {
    func featchData() {
        self.Collectionview.reloadData()
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    func showSuccessMessage(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
   
    func setupCollection() {
        Collectionview.delegate = self
        Collectionview.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            let width = UIScreen.main.bounds.width
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: width / 2, height: width / 2)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            Collectionview!.collectionViewLayout = layout
        
        
    }
    
    
    
    func fetchingDataSuccess(dataa: ShipmentData) {
     //   self.id = "\(dataa.id)"
        
        self.customerName.text = dataa.user_name
        self.animalType.text = dataa.animal
        self.deleiveringLoca.text = dataa.deliver_address
        self.resieveLoca.text = dataa.receive_address
        self.paymentMethod.text = dataa.payment_type_
        self.streetName.text = dataa.place_name
        self.shipmentDetails.text = dataa.desc
        
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func gotoAddOfferVc() {
        let vc = Storyboard.Main.viewController(sendOfferVC.self)
        vc.id = self.id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
