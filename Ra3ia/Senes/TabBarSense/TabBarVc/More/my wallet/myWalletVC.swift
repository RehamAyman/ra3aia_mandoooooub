//
//  myWalletVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class myWalletVC: UIViewController {
    var presenter : MyWalletPresenter!

    @IBOutlet weak var walletLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MyWalletPresenter(view: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillApper()
    }

 
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settellment(_ sender: UIButton) {
    }
}
