//
//  mywalletPresenter .swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//

import Foundation
import SKActivityIndicatorView
extension myWalletVC : myWalletView {
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
    
    func setWalletMony(mony: String) {
        self.walletLabel.text = mony
        
    }
    
    
}
