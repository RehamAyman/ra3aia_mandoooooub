//
//  paymentVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/10/21.
//

import UIKit





class paymentVC: UIViewController {
    var presenter : paymentPresenter!
    
    
    //MARK:- OUTLETS
    
    
    @IBOutlet weak var confirmOutlet: UIButton!
    
    
    //MARK:- CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = paymentPresenter(view: self)
        presenter.viewDidLoad()
        
    }
    

    //MARK:- IBACTIONS

    @IBAction func confirmButton(_ sender: UIButton) {
    }
    
    @IBAction func cameraButton(_ sender: UIButton) {
    }
    
}
