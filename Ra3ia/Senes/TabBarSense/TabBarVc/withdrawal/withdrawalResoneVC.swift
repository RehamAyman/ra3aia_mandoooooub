//
//  withdrawalResoneVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/10/21.
//

import UIKit



class withdrawalResoneVC: UIViewController {
    var presenter : withdrawalPresenter!
    var id = ""
    
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var reason: UITextView!
    
    
    
    
    //MARK:- CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
          presenter = withdrawalPresenter(view: self)
           presenter.viewDidload()
       
    }
    

    //MARK:- IBACTIONS

    @IBAction func confirm(_ sender: UIButton) {
        if reason.text == "" {
            completData(title: "", message: "please enter withdrawal reason ")
        } else {
        presenter.sendWithdrawal(id: id, reason: reason.text )
            
            
        }}
    
}
