//
//  addNewBankAccVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import UIKit





class addNewBankAccVC: UIViewController {
    //let picker = UIImagePickerController()
    
    
    var presenter : addNewBankPresenter!
    //var imageArray = [UIImage()]
    var uploadImge = [UploadData]()
    
    //MARK:- OUTLETS
    
    
    @IBOutlet weak var ibanNumber: EditableTextField!
    @IBOutlet weak var accountNumber: EditableTextField!
    @IBOutlet weak var bankName: EditableTextField!
    @IBOutlet weak var Selectedimage: UIImageView!
    @IBOutlet weak var addOutlet: UIButton!
    
    
    //MARK:- CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
         presenter = addNewBankPresenter(view: self)
         presenter.viewDidload()
    }
    
    //MARK:- IBACTIONS

    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addButton(_ sender: UIButton) {
        
        //self.navigationController?.popViewController(animated: true)
        presenter.addBankAccount(bankName: self.bankName.text ?? "" , ibanNumber: self.ibanNumber.text ?? "" , accNumber: self.accountNumber.text ?? "" , image: uploadImge)
        
    }
    
    @IBAction func cameraButton(_ sender: UIButton) {
        self.AddImageAlert()
    }
}
