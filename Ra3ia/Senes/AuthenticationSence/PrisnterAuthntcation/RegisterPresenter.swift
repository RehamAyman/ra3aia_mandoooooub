//
//  RegisterPresenter.swift
//  Ra3ia
//
//  Created by Sara Mady on 24/03/2021.
//

import Foundation

//MARK:- protocols

protocol RegisterView : class {

    func GotoNextPage ()
    func ViewDidLoad ()
    func showMsg(msg:String)
    func passingDataToNextPage()
    func gotoTermsScreen ()
    func gotoSelectLocation ()
   
    
    //func showIndicator()
   // func hideIndicator()
   // func showError(error:String)
    
    
    
    
}


protocol RegisterSpecializationCellView {
    func setSpecialization ( Specialization : String )
}




//MARK:- presenter class

class  RegisterVCpresenter {
    
    //MARK:- 1 variabals
    
    
    private weak var view : RegisterView?
    var utils = AppUtils()
  
    
    
    //MARK:- 2 view initionalizer
    
    init(view : RegisterView) {
        self.view = view
    }
    
    
    
    
    
    //MARK: - 3 class functions
   
    
    func gotoNextScreen () {
        self.view?.GotoNextPage()
    }
    func viewDIDload () {
        self.view?.ViewDidLoad()
       
    }
    
    func gotoNextPage () {
        self.view?.passingDataToNextPage()

    }
    
    
    func gotoSelectLocation () {
        self.view?.gotoSelectLocation()
    }
    
    func gotoTermsScreen() {
        self.view?.gotoTermsScreen()
    }
    
    
   
}
