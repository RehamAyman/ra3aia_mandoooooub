//
//  bankAccountsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class bankAccountsVC: UIViewController {
    
    
    var presenter : BankingAccPresenter!

    
    
    //MARK:- OUTLETS
    
   
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var AddOutlet: UIButton!
    
    
    
    //MARK:- CYCLE

  
    override func viewDidLoad() {
        super.viewDidLoad()

     presenter = BankingAccPresenter(view: self)
        presenter.ViewDidload()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppeare()
    }
   

   
    //MARK:- IBACTIONS
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addButton(_ sender: UIButton) {
        presenter.GOtoAddNewBankAcc()
        
        
    }
}
