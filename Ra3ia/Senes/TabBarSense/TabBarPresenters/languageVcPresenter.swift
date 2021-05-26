//
//  languageVcPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/11/21.
//


import Foundation

// protocols ]

protocol LanguageView : class {
    func setUpPicker ()
    func changeLanguageToArabic()
    func changeLanguageToEnglish()
   
}





class languageVcPresenter {
    private weak var view : LanguageView?
    
    
    init(view : LanguageView) {
        self.view = view
    }
    
    
    func viewDidLoad ()  {
        self.view?.setUpPicker()
    }
    func changeLaguageToArabic () {
        self.view?.changeLanguageToArabic()
    }
    func changeLanguageToEnglish() {
        self.view?.changeLanguageToEnglish()
    }
   
    
    
}
