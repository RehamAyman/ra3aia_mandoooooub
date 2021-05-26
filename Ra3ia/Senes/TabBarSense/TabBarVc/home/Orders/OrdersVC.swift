//
//  OrdersVC.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/20/21.
//

import UIKit

class OrdersVC: UIViewController {
    
    var presenter : OrdersVCPresenter!
    //MARK: - Outlets
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var SegmentOutlet: UISegmentedControl!
    
    
    //MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = OrdersVCPresenter(view: self)
        
        setupTableView()
        
     
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillApper()
    }
   
    
  
    //MARK: - IBActions
    
    @IBAction func NotificationPressed(_ sender: UIButton) {
        presenter.gotoNotificationScreen()
    }
    @IBAction func segementController(_ sender: UISegmentedControl) {
        presenter.viewWillApper()
    }
    
  

}
