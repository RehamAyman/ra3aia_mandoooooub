//
//  CallUsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/25/21.
//

import UIKit

class CallUsVC: UIViewController {
    var presenter : CullUsPresnter!
    
    //MARK:- OUTLETS
    

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var whatssapLbl: UILabel!
    
    
    
  
    //MARK: - VIEWDIDLOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CullUsPresnter(view: self)
       // presenter.viewWillApper()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillApper()
    }

    
    
    //MARK: - IBACTIONS

    @IBAction func twitter(_ sender: UIButton) {
        presenter.openTwtter()
    }
    
    @IBAction func linkedIn(_ sender: UIButton) {
        presenter.openLinkedIn()
    }
    
    @IBAction func facebook(_ sender: UIButton) {
        presenter.openFaceBook()
    }
    
    @IBAction func instagram(_ sender: UIButton) {
        presenter.openInstgram()
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
