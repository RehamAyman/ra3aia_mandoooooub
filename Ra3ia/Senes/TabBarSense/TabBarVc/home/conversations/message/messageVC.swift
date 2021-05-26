//
//  messageVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/10/21.
//

import UIKit
import PopMenu
import Stickerpipe



class messageVC: UIViewController  {
   
    
    var presenter : messagePresenter!
    var imagePicker = UIImagePickerController()
  
 
    
    //MARK:- OUTLETS

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var messageText: EditableTextField!
    
    //MARK:- CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = messagePresenter(view: self)
         presenter.viewDidLoad()
          messageText.allowsEditingTextAttributes = true
        
        
        
      
    }
    

   
    //MARK:- IBACTIONS

    @IBAction func back(_ sender: UIButton) {
      
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    @IBAction func menu(_ sender: UIButton) {
        
       presenter.setUpPopUp()
       
       
        
        
        
         
                
    }
    
    
}
