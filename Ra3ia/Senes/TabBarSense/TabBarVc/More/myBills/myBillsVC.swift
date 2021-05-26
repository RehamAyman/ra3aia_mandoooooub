//
//  myBillsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class myBillsVC: UIViewController {
   
    //MARK:- vars & globals
    

    var presenter : MyBillsPresenter!
    
    
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var tableview: UITableView!
    
    //MARK:- CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        
        presenter = MyBillsPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    //MARK:- IBACTIONS
  
    @IBAction func back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
 
}
