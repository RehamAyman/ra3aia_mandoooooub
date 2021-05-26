//
//  complaints+presenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/26/21.
//

import Foundation
import SKActivityIndicatorView
extension ComplaintsVC:ComplaintsView{
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccessMessga(msg: String) {
        showSuccessAlert(title: "", message: msg)
        
        self.contentVIew.text = ""
        self.SubjectTitleTextField.text = ""
    }
    
    func showComplateData(msg: String) {
        completData(title: "", message: msg)
    }
    
    
}
