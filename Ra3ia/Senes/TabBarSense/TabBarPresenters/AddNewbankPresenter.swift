//
//  AddNewbankPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import Foundation


// protocols

protocol addNewBankView : class {
    
    func AddBtnTopCorners ()
    func showImage()
    func hideImage()
    func openCamera()
    func showIndicator()
    func hideIndicator()
    func showSuccessMsg( msg : String)
    func showError(error: String )
    func backScreen()
}



class addNewBankPresenter {
    private weak var view : addNewBankView?
    
    
    init(view : addNewBankView) {
        self.view = view
    }
    
    
    
    
    func viewDidload (){
        self.view?.AddBtnTopCorners()
        self.view?.hideImage()
    }
    func openCamera() {
        self.view?.showImage()
        self.view?.openCamera()
    }
    
    func addBankAccount(bankName : String , ibanNumber : String , accNumber : String ,image:[UploadData] ){
        view?.showIndicator()
        TabBarinteractor.addBankAccount(bankName: bankName, accNumber: accNumber, ibanNumber: ibanNumber).send(DefaultResponse.self, data: image,  completion: {
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):

                print("failure\(String(describing: error))")
            case .success(let value):
               
                self.view?.showSuccessMsg(msg: value.msg ?? "" )
                self.view?.backScreen()
                
                
            
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        })
    }
}
