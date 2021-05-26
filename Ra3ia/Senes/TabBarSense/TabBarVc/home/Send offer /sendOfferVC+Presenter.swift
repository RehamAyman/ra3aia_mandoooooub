//
//  sendOfferVC+Presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation
import SKActivityIndicatorView


extension sendOfferVC : sendOfferView , selectDate , selecttime {
    func MakeBtnRound() {
        self.sendOutlet.AddTOPCorners(num: 25)
    }
    
    func selectedtime(date: String) {
        self.timeTextField.text = date
    }
    func showIndicator() {
        SKActivityIndicator.show()
    }
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    func gotoHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(HomeNavigationController.self)
            
                window.rootViewController = Vc
            }
        
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    func showSuccessMessage(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    
    
    
    func selectedDate(date: String) {
        self.selectDateTXTfield.text = "\(date)"
    }
    
    func goSelectDate() {
        let vc = Storyboard.Main.viewController(SelectDateVC.self)
        vc.delgate = self
        
        present(vc, animated: true, completion: nil)
    }
    
    func GoselectTime() {
        let vc = Storyboard.Main.viewController(selectTimeVC.self)
        vc.delgate = self
        present(vc, animated: true, completion: nil)
    }
    
    
}
