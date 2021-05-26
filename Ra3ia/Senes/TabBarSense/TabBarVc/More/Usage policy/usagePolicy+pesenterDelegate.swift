//
//  usagePolicy+pesenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//

import Foundation

import Foundation
import SKActivityIndicatorView
extension UsagePolicyVC:  UsagePolicyView{
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
   
    func setUsagePolicyData(usgePolcy : String) {
    let htmlData = NSString(string: usgePolcy).data(using: String.Encoding.unicode.rawValue)
                  let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
                                  NSAttributedString.DocumentType.html]
                  let attributedString = try? NSMutableAttributedString(data: htmlData ?? Data(),
                                                                        options: options,
                                                                        documentAttributes: nil)
                  self.usageTextView.attributedText = attributedString
    }
    
}
