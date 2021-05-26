//
//  MoreVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/21/21.
//

import UIKit


class MoreVC: UIViewController {
    
    var presenter : MoreVcPresenter!
    
//MARK: - outlets
  
   
    @IBOutlet weak var tableview: UITableView!
    
   
    
    //MARK: -  cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter = MoreVcPresenter(view: self)
        presenter.ViewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        presenter.showAnimation()
        
    }
    
    
    

    //MARK: - IBActions
    
    @IBAction func NotificationPressed(_ sender: UIButton) {
        presenter.GotoNotificationScreen()
       
    }
    
    
  
 
}
