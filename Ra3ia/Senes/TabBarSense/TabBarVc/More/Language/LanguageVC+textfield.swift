//
//  LanguageVC+textfield.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/23/21.
//

import UIKit
import Localize_Swift
import IQKeyboardManagerSwift





extension LanguageVC : UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate {
    
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PiCklanguages.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PiCklanguages[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CurrentLanguage = row
        LangTextfield.text = PiCklanguages[row]


    
}

    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == LangTextfield {
                   if LangTextfield.text == "English" {
                     
                       presenter.changeLanguageToEnglish()
                       print("changed to english")
                       

                   } else if LangTextfield.text == "العربيه" {
                      
                       presenter.changeLaguageToArabic()
                       
                       print("changed to arabic")
                      
                   }
                   
                  
              
           }
    }
    
    
}
    
