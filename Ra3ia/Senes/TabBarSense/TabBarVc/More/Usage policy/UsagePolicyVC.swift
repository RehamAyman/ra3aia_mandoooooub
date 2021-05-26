//
//  UsagePolicyVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/23/21.
//

import UIKit

class UsagePolicyVC: UIViewController {
    // MARK: - OUTLETS
    var presenter : UsagePolicyVCPresnter!
    
    @IBOutlet weak var usageTextView: UITextView!
    
    
    
    // MARK: - VIEWDIDLOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = UsagePolicyVCPresnter(view: self)
        presenter.viewWillApper()

      
    }
    
    
    // MARK: - Actions

    @IBAction func BackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    


}
