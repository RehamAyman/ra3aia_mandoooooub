//
//  verificationVc.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import UIKit

class verificationVc: UIViewController {

    var presenter : verificationPresenter!
    
    @IBOutlet weak var avtivationCodeText: curvedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = verificationPresenter(view: self)

    }
    

    @IBAction func didnotRecCode(_ sender: UIButton) {
        presenter.resendCode()
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        
        
        presenter.cheackValidData(vrefcationCode:  avtivationCodeText.text ?? "" )
        
    }
}
