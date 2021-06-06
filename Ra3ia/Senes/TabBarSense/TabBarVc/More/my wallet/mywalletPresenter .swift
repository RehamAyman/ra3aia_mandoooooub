//
//  mywalletPresenter .swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//



import  UIKit
import SKActivityIndicatorView
import SafariServices


extension myWalletVC : myWalletView  , SFSafariViewControllerDelegate{
    func featchData(data: WalletData) {
        self.walletLabel.text = data.wallet
        self.url = data.charge_url
    }
    
   
    
 

    func FeatchData(rate: String) {
        
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
    
    func openSafariUrl () {
        if let url = URL(string: self.url) {
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                vc.delegate = self
                present(vc, animated: true)
            }
    }
    
    
}
