//
//  SelectPayMtehodVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import UIKit

class SelectPayMtehodVC: UIViewController {
    var presenter : selectPaymentVCPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

       presenter = selectPaymentVCPresenter(view: self)
    }
    

    @IBAction func bankTransfer(_ sender: UIButton) {
        
    }
    @IBAction func creditCardButton(_ sender: UIButton) {
    }
    
    @IBAction func applePay(_ sender: UIButton) {
    }
    
    @IBAction func stcPay(_ sender: UIButton) {
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
