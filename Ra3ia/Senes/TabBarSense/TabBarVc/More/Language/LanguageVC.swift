//
//  LanguageVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/22/21.
//

import UIKit

class LanguageVC: UIViewController {
   
    //languageVcPresenter
    @IBOutlet weak var LangTextfield: UITextField!
    
    
    
//    var presenter : languageVCPresenter!
    var presenter : languageVcPresenter!
    let LanguagePicker = UIPickerView()
    var PiCklanguages = ["English", "العربيه"]
    var CurrentLanguage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = languageVcPresenter(view: self)
        presenter.viewDidLoad()
     
    }
    
    

    @IBAction func BackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
   
    
    

}
