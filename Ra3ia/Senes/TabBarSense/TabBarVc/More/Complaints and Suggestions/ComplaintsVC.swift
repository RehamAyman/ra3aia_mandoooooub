//
//  ComplaintsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/25/21.
//

import UIKit

class ComplaintsVC: UIViewController {
    var presenter : ComplaintsVCPresnter!
    
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var SendOutlet: UIButton!
    @IBOutlet weak var SubjectTitleTextField: UITextField!
    
    @IBOutlet weak var contentVIew: UITextView!
    
    
    
    //MARK: -  VIEW DIDLOAD
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SendOutlet.AddTOPCorners(num: 15)
        presenter = ComplaintsVCPresnter(view: self)
      
    }
    
    //MARK: -  ACTIONS
 
    @IBAction func SendButton(_ sender: UIButton) {
        presenter.CheckData(subject: self.SubjectTitleTextField.text ?? "", content:  self.contentVIew.text ?? "")
    }
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
