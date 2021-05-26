//
//  Registervc.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/3/21.
//

import UIKit
import BEMCheckBox

class Registervc: UIViewController {
    var presenter : RegisterVCpresenter!
    var lat = 0.0
    var lng = 0.0
//MARK:- OUTLETS
    @IBOutlet weak var UserNameTextField: curvedTextField!
    @IBOutlet weak var checkMark: BEMCheckBox!
    
    @IBOutlet weak var firstName: curvedTextField!
    @IBOutlet weak var PhoneNumField: curvedTextField!
    
    @IBOutlet weak var emailField: curvedTextField!
    
    @IBOutlet weak var AddressField: curvedTextField!
    
    @IBOutlet weak var PasswordField: curvedTextField!
    
    @IBOutlet weak var retypePasswordField: curvedTextField!
    
    //MARK:- CYCLE
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = RegisterVCpresenter(view: self)
        presenter.viewDIDload()
    }
    
    
    //MARK: - IBACTIONS
    
    @IBAction func locationButton(_ sender: UIButton) {
        
        let vc = Storyboard.Authntication.viewController(SelectLocationViewController.self)
        vc.delegate = self
                                
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func termsconditions(_ sender: UIButton) {
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
      
        presenter.gotoNextPage()
        
    }
    
 
    @IBAction func backToLogin(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
