//
//  BankingAccountsPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation
// protocols

protocol bankingAccountView : class  {
    func setUpTable ()
    func RoundBtnTopCorners()
    func gotoAddNewBankAcc()
    func showIndicator()
    func hideIndicator()
    func showError(error: String )
    func featchingData ()
}



protocol BankAccountsCellView {
//cell.SetAnimalType(AnimalType: "Animal: \(completedOrdersArray[index].animal)".localized())
   func setBankImage ( image : String)
    func setBankName ( name : String)
    func setAccountNumber ( num : String)
    func setIbanNumber ( num : String)
    
}




class BankingAccPresenter {
    private weak var view : bankingAccountView?
    private var arrayOfBank = [BankData]()
    
    
    
    
    init(view : bankingAccountView) {
        self.view = view
    }
    
    
    func ViewDidload () {
        self.view?.setUpTable()
        self.view?.RoundBtnTopCorners()
    }
    func getbanksCount() -> Int {
        return arrayOfBank.count
    }
    
    func GOtoAddNewBankAcc() {
        self.view?.gotoAddNewBankAcc()
    }
    
    func viewWillAppeare () {
        self.arrayOfBank.removeAll()
        self.getBanksData()
    }
    func configureBankCells(cell: BankAccountsCellView, for index: Int) {
        
        cell.setAccountNumber(num: arrayOfBank[index].acc_number)
        cell.setBankName(name: arrayOfBank[index].bank_name)
        cell.setBankImage(image: arrayOfBank[index].bank_image)
        cell.setIbanNumber(num: arrayOfBank[index].iban_number)
      
    }
    
    func getBanksData(){
        view?.showIndicator()
        TabBarinteractor.bankAccounts.send(BankModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                self.arrayOfBank = value.data
                
                self.view?.featchingData()
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }

    
}
