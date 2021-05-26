//
//  conversationsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/8/21.
//

import UIKit




class conversationsVC: UIViewController {
    var presenter : conversationsPresenter!

    
    
    //MARK:- OUTLETS
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    //MARK:- CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = conversationsPresenter(view: self)
        presenter.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
    
    
    //MARK:- IBACTIONS

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
