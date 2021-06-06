//
//  LanguageVcPresenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/23/21.
//

import Foundation
import  UIKit
import PopMenu
import CBFlashyTabBarController


extension LanguageVC : LanguageView {
    func setTextBidding() {
        self.LangTextfield.setLeftPaddingPoints(8)
        self.LangTextfield.setRightPaddingPoints(8)
    }
    
    func setUpPopUp() {
       
      
        let manager = PopMenuManager.default
        let action1 = PopMenuDefaultAction(title: "English      ", image: UIImage(named: "eye")) { (acion) in
            //self.presenter.openCamera()
            self.LangTextfield.text = "English "
            self.changeLanguageToEnglish()
            self.BackHome()
         
        }
        let action2 = PopMenuDefaultAction(title: "العربية", image: UIImage(named: "eye")) { (action) in
            self.LangTextfield.text = "العربية"
            self.changeLanguageToArabic()
            self.BackHome()
            
            
        }
       
     
        manager.addAction(action1)
        manager.addAction(action2)
        
        manager.popMenuAppearance.popMenuColor.actionColor = .tint(UIColor(named: "BaseColour")!)
        manager.popMenuAppearance.popMenuFont = UIFont(name: "Fairuz-Bold", size: 16)!
        manager.popMenuAppearance.popMenuColor.backgroundColor = .solid(fill: .white)
        manager.popMenuAppearance.popMenuItemSeparator = .fill(UIColor(named: "BaseColour")!, height: 1)
        
        
       
        
        manager.present(sourceView: self.LangTextfield, on: self, animated: true, completion: nil)
        
      
           
    }
    
  
    
    func changeLanguageToArabic() {
        AppLanguage.setAppLanguage(lang: "ar")
        Localizer.DoTheExhange()
        self.setAppSemantic()
        
      
    }
    
    func changeLanguageToEnglish() {
        
        AppLanguage.setAppLanguage(lang: "en")
        Localizer.DoTheExhange()
        self.setAppSemantic()
        
        
       
    }
    
  
    
    
 
   
    private func setAppSemantic() {
            // app direction
            if AppLanguage.currentLanguage().contains("en") {
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                UILabel.appearance().semanticContentAttribute = .forceLeftToRight
                UITextField.appearance().textAlignment = .left
                UITextView.appearance().textAlignment = .left
                UITableView.appearance().semanticContentAttribute = .forceLeftToRight
                UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
            //    CBFlashyTabBar.appearance().semanticContentAttribute = .forceLeftToRight
            
            
            } else if AppLanguage.currentLanguage().contains("ar") {
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                UILabel.appearance().semanticContentAttribute = .forceRightToLeft
                UITextField.appearance().textAlignment = .right
                UITextView.appearance().textAlignment = .right
                UITableView.appearance().semanticContentAttribute = .forceRightToLeft
                UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
              //  CBFlashyTabBar.appearance().semanticContentAttribute = .forceRightToLeft
                
            }
        }
    func BackHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
            
                window.rootViewController = Vc
            }
        
    }
    
    
    
}


