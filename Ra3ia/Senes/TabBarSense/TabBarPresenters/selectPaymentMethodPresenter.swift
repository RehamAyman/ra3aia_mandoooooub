//
//  selectPaymentMethodPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation
// protocol

protocol selectPaymentView : class {
   
}





class selectPaymentVCPresenter {
    
    
    private weak var view : selectPaymentView?
    
    
    init(view : selectPaymentView) {
        self.view = view
    }
    
    
   
    
}
