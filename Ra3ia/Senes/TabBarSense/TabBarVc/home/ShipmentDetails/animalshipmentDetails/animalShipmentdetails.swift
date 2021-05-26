//
//  animalShipmentDetails.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/12/21.
//

import UIKit

class animalShipmentDetails: UIViewController {
    var id = "0"
    var idd = 0
    
    
    var presenter : AnimalShipmentPresenter!
    
    @IBOutlet weak var finishOrder: UIButton!
    @IBOutlet weak var rechedBackClient: UIButton!
    @IBOutlet weak var finishedAtClinicOutlet: UIButton!
    @IBOutlet weak var goBackOutlet: UIButton!
    @IBOutlet weak var rechedClinicOutlet: UIButton!
    @IBOutlet weak var backOutlet: UIButton!
    @IBOutlet weak var goToClinicOutlet: UIButton!
    @IBOutlet weak var retchedCustomerOutlet: UIButton!
    @IBOutlet weak var acceptStack: UIStackView!
    @IBOutlet weak var startStack: UIStackView!
    @IBOutlet weak var clinicName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var animalType: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var clinicAddress: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var customerLocation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AnimalShipmentPresenter(view: self)
        presenter.viewDidLoad()
        self.presenter.getShipmentModel(id: Int(id)!)
        
        

     
    }
    

    @IBAction func accesept(_ sender: UIButton) {
        presenter.sendAcceptOrder(id: Int(id) ?? 0)
    }
    
    @IBAction func withdrawalButton(_ sender: UIButton) {
        let vc = Storyboard.Main.viewController(withdrawalResoneVC.self)
        vc.id = id
        self.present(vc, animated: true, completion: nil)
    }
  
    
    
    @IBAction func startButton(_ sender: UIButton) {
        presenter.sendChangeOrder(id: id, status: "go_ahead_to_client")
        self.ChangeButtonsWhenStartTap()
    }
    
    
    
    
    @IBAction func refuse(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
 
    
    @IBAction func reachedCustomerBtn(_ sender: UIButton) {
        presenter.sendChangeOrder(id: id, status: " reached_client")
        self.changeBtWhnReachCustomerTap()
        
    }
    
    
    @IBAction func goToClinic(_ sender: UIButton) {
        presenter.sendChangeOrder(id: id, status: "go_to_clinic")
        self.changeBtWhnGoToClinic()
    }
    
    @IBAction func rechedClinic(_ sender: UIButton) {
        
        presenter.sendChangeOrder(id: id, status: "reached_clinic")
        self.changeBtnWhenrechedClinic()
        
        
        }
  
    
    @IBAction func finishedAtClinic(_ sender: UIButton) {
        presenter.sendChangeOrder(id: id, status: "finished_at_clinic")
        self.changeBtnWhenFinishedAtClinic()
    }
    
    
    
    @IBAction func goBackBtn(_ sender: UIButton) {
        presenter.sendChangeOrder(id: id, status: "go_back")
        self.changeBtnWhenGoBackTapped()
         
      }
    
    
    
    @IBAction func rechedBackBtn(_ sender: UIButton) {
        presenter.sendChangeOrder(id: id, status: "reached_back_client")
        self.changeBtnWhenBackToclient()
        
    }
    
    @IBAction func finishOrder(_ sender: UIButton) {
        presenter.sendFinishOrder(id: id)
        
    }
}

