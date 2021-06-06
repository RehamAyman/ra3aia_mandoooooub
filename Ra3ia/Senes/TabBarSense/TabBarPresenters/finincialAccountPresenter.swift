//
//  finincialAccountPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import Foundation

// protocols

protocol finincialAccView : class {
    func setUpTableview ()
    func gotoSelectPayMethodVC()
    func showIndicator()
    func hideIndicator()
    func FeatchData(FininalAccountData:FinAccountData)
    func showError(error: String )
    func openSetallUrl()
    
}


protocol FinancialCellsView {
    func displayOrderNumber (ordernum : String)
    func displayCommsion (com : String)
    func displayPrice (price : String)

}



class finincialAccPresenter {
    
    private weak var view : finincialAccView?
    private var CommissionArray = [Commissions]()

    
    
    init (view : finincialAccView ) {
        self.view = view
    }
    func ConfigerCell(cell:finincialAccCell,index:Int){
        cell.displayCommsion(com: self.CommissionArray[index].commission)
        cell.displayPrice(price: self.CommissionArray[index].total_price)
        cell.displayOrderNumber(ordernum:String( self.CommissionArray[index].id))
    }
    
    func ViewDidLoad () {
        self.view?.setUpTableview()
    }
    func GotoSelectPayMethod () {
        self.view?.gotoSelectPayMethodVC()
    }
    func getCellsCount () -> Int {
        return self.CommissionArray.count
    }
    func viewWillAppear() {
        self.CommissionArray.removeAll()
        self.getFininalAccount()
    }
    
    func getFininalAccount(){
        view?.showIndicator()
        TabBarinteractor.FinAccount.send(FinincialAccModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.CommissionArray = value.data.commissions
                self.view?.FeatchData(FininalAccountData: value.data)
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
}
