//
//  PaymentVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/5/21.
//

import UIKit


class selectPaymentMethodVC: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    
    // 13 paramter
   
    
    
    
    var presenter : selectPaymentPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = selectPaymentPresenter(view: self)
       
        setupTableView()
        FetchingData()
        
    }
    

 
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    
}
