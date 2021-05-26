//
//  callUsPresenter+delegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//

import Foundation
import Foundation
import SKActivityIndicatorView

extension CallUsVC : CullUsView{
    func setPhoneNum(phone: String) {
        self.phoneLabel.text = phone
    }
    
    func setWhatssapp(whatsNumber: String) {
        self.whatssapLbl.text = whatsNumber
    }
    
    
    func setEmail(email: String) {
        self.emailLbl.text = email
    }
    
    
    func openFaceBook(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openTwitter(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openWhatsApp(link: String) {
        let urlString = link

        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let URL = NSURL(string: urlStringEncoded!)

        if UIApplication.shared.canOpenURL(URL! as URL) {
            UIApplication.shared.openURL(URL! as URL)
        }
    }
    
    func openInstagram(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openLinkedIn(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
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
