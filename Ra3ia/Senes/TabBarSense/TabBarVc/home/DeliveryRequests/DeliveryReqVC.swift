//
//  OrderRequsetsVC.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/19/21.
//

import UIKit

class DeliveryReqVC: UIViewController {
    var presenter : DeliveryReqVCPresenter!
    var lat = 31.0335251
    var lng = 30.4552283
    

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DeliveryReqVCPresenter(view: self)

        presenter.viewDidload()
        

    
        
        
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getReqData(lat: lat, lng: lng)
      
        
    }
    

 

    @IBAction func NotificationsButton(_ sender: UIButton) {
        presenter.gotoNotificationVC()
    }
    @IBAction func MessageButton(_ sender: UIButton) {
        presenter.gotoConversationsScreen()
    }
}
