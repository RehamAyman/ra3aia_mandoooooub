//
//  myWalletPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//

import Foundation

//MARK:- protocols


protocol myWalletView : class {
    func FeatchData(rate:String)
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func featchData ( data : WalletData)
   

}



//MARK:- presenter class

class MyWalletPresenter {
    //MARK:- 1 variabals
    private weak var view : myWalletView?
    private var link = ""
 

    //MARK:- 2 view initionalizer
    
    init(view: myWalletView) {
        self.view = view
    }
    

    //MARK: - 3 class functions
    
    func viewWillApper(){
       self.getMessagesRequest()
    }
    func getMessagesRequest(){
        view?.showIndicator()
        TabBarinteractor.wallet.send(walletModel.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):

                print("failure\(String(describing: error))")
            case .success(let value):
                print(value)
              //  self.view?.FeatchData(rate: value.data.rate)
                self.view?.featchData(data: value.data)
                
             //   self.view?.setUrl(url: value.data.charge_url)


            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }

   
  
}

