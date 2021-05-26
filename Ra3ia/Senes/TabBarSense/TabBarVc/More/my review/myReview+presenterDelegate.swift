//
//  myReview+presenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//
import Foundation

import SKActivityIndicatorView

extension MyReviewVC:MyReviewView{
    func FeatchData(rate: String) {
       
        self.reviewStars.rating = Double(rate) ?? 0.0
        
        
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    
}
