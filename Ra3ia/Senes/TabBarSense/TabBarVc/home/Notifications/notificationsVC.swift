//
//  notificationsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//

import UIKit

class notificationsVC: UIViewController {
    
    
    var presnter:NotificatonPresenter!
    //MARK:- OUTLETS
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    //MARK:- VIEWDIDLOAD
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presnter = NotificatonPresenter(view: self)
        self.SetUpTableview()
        presnter.viewWillApper()
     
        
        
    }
    

    
    
    
    //MARK:- ACTIONS
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
