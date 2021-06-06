//
//  finincialAccountVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class finincialAccountVC: UIViewController {
    
    var presenter : finincialAccPresenter!
    //MARK:- OUTLETS
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var totalReq: UILabel!
    @IBOutlet weak var ammountToPaied: UILabel!
    var SetAllurl = ""
    
    
    //MARK:- CYCLExxxz
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("======== view did load +=========== ")
        print(SetAllurl)
        
        
        
        presenter = finincialAccPresenter(view: self)
        presenter.ViewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
        
    }

    //MARK:- IBACTIONS
    @IBAction func settalBuutom(_ sender: UIButton) {
        self.openSetallUrl()
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
