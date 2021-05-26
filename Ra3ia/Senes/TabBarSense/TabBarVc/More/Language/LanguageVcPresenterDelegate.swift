//
//  LanguageVcPresenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/23/21.
//

import Foundation
import  UIKit


extension LanguageVC : LanguageView {
    func setUpPicker() {
        
        LanguagePicker.delegate = self
        LanguagePicker.dataSource = self
        LangTextfield.inputView = LanguagePicker
        
    }
    
    func changeLanguageToArabic() {
        AppLanguage.setAppLanguage(lang: "ar")
        Localizer.DoTheExhange()
        self.setAppSemantic()
        
        guard let window = UIApplication.shared.keyWindow else { return }
        let vc =  Storyboard.Main.viewController(HomeNavigationController.self)
        window.rootViewController = vc
    }
    
    func changeLanguageToEnglish() {
        
        AppLanguage.setAppLanguage(lang: "en")
        Localizer.DoTheExhange()
        self.setAppSemantic()
        
        
        guard let window = UIApplication.shared.keyWindow else { return }
        
        let vc =  Storyboard.Main.viewController(HomeNavigationController.self)
        window.rootViewController = vc
    }
    
  
    
    
    func SetUpPicker() {
        LanguagePicker.delegate = self
        LanguagePicker.dataSource = self
        LangTextfield.inputView = LanguagePicker
        
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
            } else if AppLanguage.currentLanguage().contains("ar") {
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                UILabel.appearance().semanticContentAttribute = .forceRightToLeft
                UITextField.appearance().textAlignment = .right
                UITextView.appearance().textAlignment = .right
                UITableView.appearance().semanticContentAttribute = .forceRightToLeft
                UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            }
        }
    
    
    
}


