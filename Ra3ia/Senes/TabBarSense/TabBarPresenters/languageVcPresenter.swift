//
//  languageVcPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/11/21.
//


import Foundation

// protocols ]

protocol LanguageView : class {
   
    func changeLanguageToArabic()
    func changeLanguageToEnglish()
    func setUpPopUp()
    func setTextBidding()
   
}





class languageVcPresenter {
    private weak var view : LanguageView?
    
    
    init(view : LanguageView) {
        self.view = view
    }
    
    
    func viewDidLoad ()  {
        self.view?.setTextBidding()
    }
    func changeLaguageToArabic () {
        self.view?.changeLanguageToArabic()
    }
    func changeLanguageToEnglish() {
        self.view?.changeLanguageToEnglish()
    }
    func setUpPOPUp() {
        self.view?.setUpPopUp()
    }
   
    
    
}
