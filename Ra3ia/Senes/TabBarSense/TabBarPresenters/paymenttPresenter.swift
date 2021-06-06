//
//  paymenttPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/5/21.
//

//
import Foundation



//MARK:- protocols


protocol paymenttView: class {
    func fetchingDataSuccess()
    func gotoCreditCard ()
    func gotoApplePay ()
    func gotoBankTransfer ()
    func gotoSTCpay ()


    func setUpTabel()
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
    func showSuccess(msg: String)
    func showAnimated()
    
    
    
}


protocol configerPayemntMethod{
    func showImage(imge:String)
    func showNAme(name:String)
}

//MARK:- presenter class

class selectPaymentPresenter {
    //MARK:- 1 variabals
    
    private weak var view : paymenttView?
    // cells
    
   private var imagesArray = ["credit" , "apple" , "stc" , "bank"]
    
    private var mainLabelsArray = ["credit card".localized,
                                   "Apple Pay",
                                   "STC Pay".localized,
                                   "Bank transfer".localized,
                                   
    ]
    
   
                           
                              
    
    
    //MARK:- 2 view initionalizer
    
    init(view: paymenttView) {
        self.view = view
    }
    
    //MARK: - 3 class functions
    
    func getcellsCount() -> Int {
        return mainLabelsArray.count
    }
    
    func ConfigerPaymentMethodCell(cell:PaymentMethodCellTableViewCell,index:Int) {
        cell.showImage(imge: self.imagesArray[index] )
        
        cell.showNAme(name: self.mainLabelsArray[index])
        
    }
    
    func showAnimation(){
        view?.showAnimated()
    }
    //MARK: - 3 Did Select Row
    func DidSelectRow(index:Int){
        switch index {
        case 0:
            self.view?.gotoCreditCard()
        case 1 :
            self.view?.gotoApplePay()
        case 2:
            self.view?.gotoSTCpay()
        case 3 :
            self.view?.gotoBankTransfer()
      
              
        default:
            break
        }
    }
    
    
    func ViewDidLoad () {
        self.view?.setUpTabel()
    }
    
  
    
    func  getNymberOfPaymentMethod() -> Int {
        return mainLabelsArray.count
    }
    
    
}

