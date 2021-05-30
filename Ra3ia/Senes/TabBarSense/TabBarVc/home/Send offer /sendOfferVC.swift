//
//  sendOfferVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import UIKit

class sendOfferVC: UIViewController {
    var presenter : sendOfferPresenter!
    var id = ""
    

    @IBOutlet weak var sendOutlet: UIButton!
    
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var commonTransportPrice: EditableTextField!
    @IBOutlet weak var privatePrice: EditableTextField!
    
    @IBOutlet weak var timeTextField: EditableTextField!
    @IBOutlet weak var selectDateTXTfield: EditableTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         presenter = sendOfferPresenter(view: self)
        presenter.viewDidLoad()
        print("====================================send offer ")
        
        print(id)
      
    }
    

  

    @IBAction func selectDate(_ sender: UIButton) {
        presenter.gotoSeelectData()
        
    }
    @IBAction func selectTime(_ sender: UIButton) {
        presenter.gotoSelectTime()
    }
    @IBAction func sendButton(_ sender: UIButton) {
        presenter.sendOffer(id: self.id, commonPrice: commonTransportPrice.text ?? "", privatePrice: privatePrice.text ?? "", time: timeTextField.text ?? "" , date: selectDateTXTfield.text ?? "" , notes: notes.text ?? ""  )
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
