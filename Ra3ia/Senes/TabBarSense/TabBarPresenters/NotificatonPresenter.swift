//
//  NotificatonPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/28/21.
//


import Foundation

protocol NotificationsView : class {
    func fetchingData ()
    func setUpTable ()
    
   

}


protocol NotificationCellView {
    func configuerRejectedNotifi()
    func configureAcceptedNotifi()
    func configureUserAcceptAnotherOffer()
    
}



class  NotificatioVCpresenter {
    
    //MARK:- 1 variabals
    
    
    private weak var view : NotificationsView?
 
    
    
    //MARK:- 2 view initionalizer
    
    init(view : NotificationsView) {
        self.view = view
    }
    
    
    func configerTypeCells ( cell : NotificationCellView , for index : Int){
        // api issues
        
        
        
    }
    func viewDidLoad () {
        view?.setUpTable()
    }
    
    func configRejectedNotifi( cell : notificationCell) {
        cell.configuerRejectedNotifi()
    }
    func configAcceptedNotifi( cell : notificationCell) {
        cell.configureAcceptedNotifi()
    }
    func configureUserAcceptAnotherOffer ( cell : notificationCell) {
        cell.configureUserAcceptAnotherOffer()
    }
    
    
}
