//
//  messageVC+Presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/11/21.
//

import UIKit
import PopMenu

extension messageVC : messageView {
 
    func gotoComplaintVc() {
        let vc = Storyboard.Main.viewController(ComplaintsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func setUpPopup() {
        
        let manager = PopMenuManager.default
        let action1 = PopMenuDefaultAction(title: "Send Bill", image: UIImage(named: "money")) { (acion) in
            //self.presenter.openCamera()
            self.openCamera()
        }
        let action2 = PopMenuDefaultAction(title: "Make a complaint", image: UIImage(named: "addimge")) { (action) in
            self.presenter.gotoComplaintScreen()
        }
       
     
        manager.addAction(action1)
        manager.addAction(action2)
        
        manager.popMenuAppearance.popMenuColor.actionColor = .tint(UIColor(named: "BaseColour")!)
        manager.popMenuAppearance.popMenuFont = UIFont(name: "Fairuz-Bold", size: 16)!
        manager.popMenuAppearance.popMenuColor.backgroundColor = .solid(fill: .white)
        manager.popMenuAppearance.popMenuItemSeparator = .fill(UIColor(named: "BaseColour")!, height: 1)
        

        
        manager.present(sourceView: self.menuOutlet, on: self, animated: true, completion: nil)
        
      
           
    }
    
    
    
    
    
    
    func addDropShadow() {
        self.infoView.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0 , y: 3, blur: 5, spread: 0)
        
       
        
       
    }
    func addTopShadow() {
        self.messageView.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0, y: -2, blur: 5, spread: 0)
    }
    func setUptabel() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none 
    }
 
    
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            
            self.imagePicker.delegate = self
            
            self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                            self.imagePicker.cameraCaptureMode = .photo
            
                            self.imagePicker.allowsEditing = true
                           
                            self.imagePicker.modalPresentationStyle = .fullScreen
            
           
            self.present(imagePicker, animated: true, completion: nil)
            

           
            
        
        
        
        
        
        }
     }
     
    
    
}
