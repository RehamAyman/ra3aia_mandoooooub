//
//  ShipmentdetailsVC.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/21/21.
//

import UIKit

class ShipmentdetailsVC: UIViewController{
    
    //MARK: - OUTLETS
    @IBOutlet weak var backOutlet: UIButton!
    

    @IBOutlet weak var rechedRecAdd: UIButton!
    @IBOutlet weak var rechedBackClient: UIButton!
    @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var finishOrder: UIButton!
    @IBOutlet weak var packageRecieved: UIButton!
    @IBOutlet weak var startStack: UIStackView!
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
    var isComeFromHome  = false
    var isComeFromCompletedOrder = false
    
    var isOrderSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print("=---=-=-=-=-=-=-=-=-=-=-=-=-")
        
        print(id)
        print(isComeFromHome)
        print(isOrderSelected)
        print(isComeFromCompletedOrder)
      
       setUpViews()
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
    
    @IBAction func withdrawal(_ sender: UIButton) {
        presenter.goToWithdrawal()
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        presenter.sendChangeOrder(id: self.id, status: "go_ahead_to_receive_address")
        self.ChangeButtonsWhenStartTap()
    }
    
    
    
    @IBAction func rechedToRecieveAdd(_ sender: UIButton) {
        presenter.sendChangeOrder(id: self.id, status: "reached_receive_address")
        self.changeButtonsWhenRechRecAdd()
    }
    
    
    @IBAction func packegeRec(_ sender: UIButton) {
        presenter.sendChangeOrder(id: self.id, status: "package_received")
        self.changeBtnsWhenPackageRec()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        presenter.sendChangeOrder(id: self.id, status: "go_back")
        self.changeBtnsWhenGoBack()
    }
    
    @IBAction func rechedBackClient(_ sender: UIButton) {
        presenter.sendChangeOrder(id: self.id, status: "reached_back_client")
        self.changeBtnsWhenRechedBackClient()
    }
    
    
    @IBAction func finishOrder(_ sender: UIButton) {
        presenter.sendFinishOrder(id: self.id)
    }
    
    
    
}
