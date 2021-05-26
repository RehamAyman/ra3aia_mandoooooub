//
//  messagePresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/11/21.
//

import Foundation
// protocol
protocol messageView : class {
    func addDropShadow ()
    func addTopShadow ()
    func setUptabel()
    func setUpPopup()
    func openCamera()
    func gotoComplaintVc()
    
}

protocol messageCellView {
    func makeMsgViewCurves()
}



class messagePresenter {
    private weak var view : messageView?
    
    
    init(view : messageView) {
        self.view = view
    }
    
    
    
    
    func viewDidLoad() {
        self.view?.addDropShadow()
        self.view?.addTopShadow()
        self.view?.setUptabel()
    }
    func setUpPopUp () {
        self.view?.setUpPopup()
    }
    
    func openCamera () {
        self.view?.openCamera()
    }
    func gotoComplaintScreen() {
        self.view?.gotoComplaintVc()
    }
    
}
