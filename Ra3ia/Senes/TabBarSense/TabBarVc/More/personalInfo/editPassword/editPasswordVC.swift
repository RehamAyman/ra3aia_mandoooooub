//
//  editPasswordVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/2/21.
//

import UIKit

class editPasswordVC: UIViewController {

    @IBOutlet weak var confirmOutlet: UIButton!
    @IBOutlet weak var confirmNewPassword: EditableTextField!
    @IBOutlet weak var newPassword: EditableTextField!
    @IBOutlet weak var currentPassword: EditableTextField!
    
    var presenter : editPasswordPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = editPasswordPresenter(view: self)
        presenter.viewDidLoad()

       
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func confirm(_ sender: UIButton) {
        presenter.cheackValidData(currentPassword: self.currentPassword.text ?? "" , newPassword: self.newPassword.text ?? "" , confirmNewPassword: self.confirmNewPassword.text ?? "" )
    }
    
    
}
