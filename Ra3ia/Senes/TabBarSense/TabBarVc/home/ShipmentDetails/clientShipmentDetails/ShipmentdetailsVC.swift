//
//  ShipmentdetailsVC.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/21/21.
//

import UIKit

class ShipmentdetailsVC: UIViewController{
    
    //MARK: - OUTLETS
    

    @IBOutlet weak var shipmentDetails: UITextView!
    @IBOutlet weak var deleiveringLoca: UILabel!
    @IBOutlet weak var resieveLoca: UILabel!
    @IBOutlet weak var streetName: UILabel!
    
    @IBOutlet weak var acceptStack: UIStackView!
    @IBOutlet weak var Collectionview: UICollectionView!
    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var animalType: UILabel!
    @IBOutlet weak var customerName: UILabel!
   
    
    var presenter : ShipmentPresenter!
    var id = "0"
    
    var isOrderSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print("=---=-=-=-=-=-=-=-=-=-=-=-=-")
        
        print(id)
        if isOrderSelected == true {
            self.acceptStack.isHidden = true
        } else {
            self.acceptStack.isHidden = false
        }
       
        presenter = ShipmentPresenter(view: self)

        presenter.getShipmentModel(id : Int(id)!)
       
        presenter.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppeare()
    }
   
    

    @IBAction func refuseButton(_ sender: UIButton) {
        guard let window = UIApplication.shared.keyWindow else { return }
        
        let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
        
            window.rootViewController = Vc
        
    }
    
    @IBAction func AcceptButton(_ sender: UIButton) {
        
//        presenter.sendAcceptOrder(id:Int(id) ?? 0 )
        self.gotoAddOfferVc()
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
