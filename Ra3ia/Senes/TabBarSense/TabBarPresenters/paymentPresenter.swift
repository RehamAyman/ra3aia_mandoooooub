//
//  paymentPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/10/21.
//

import Foundation
//protocol


protocol paymentView : class {
    func makeRoundBtnTopCorners ()
}


class paymentPresenter {
    private weak var view : paymentView?
    init(view : paymentView) {
        self.view = view
    }
    
    
    
    
    
    func viewDidLoad () {
        self.view?.makeRoundBtnTopCorners()
    }
}
