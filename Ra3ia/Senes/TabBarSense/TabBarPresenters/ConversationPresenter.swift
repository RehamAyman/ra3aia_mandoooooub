//
//  ConversationPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/8/21.
//

import Foundation

// protocols

protocol conversationView : class {
    
    func setUptable()
    
    func gotoChat()
    func showIndicator()
    func hideIndicator()
    func featchingData()
    func showError(error: String )
    
    
    
}


protocol conversationCellView  {
    
   
        func setRoomImage ( image : String)
        func setlastMessage ( message : String)
        func setTime ( time : String)
        func setUserName ( userName : String)
        
    
    
}




class conversationsPresenter {
   private weak var view : conversationView?
   private var arrayRooms = [Rooms]()
    
    
    
    init(view : conversationView) {
        self.view = view
    }
    
    func viewWillAppear () {
        self.arrayRooms.removeAll()
        self.view?.featchingData()
        self.getRoomsData()
        
    }
    
    func gotoChat() {
        self.view?.gotoChat()
    }
    
    func viewDidLoad() {
        
        self.view?.setUptable()
    }
    
    
    func DidSelectRow (index : Int) {
        self.view?.gotoChat()
        
    }
    func getRoomsCount() -> Int {
        return arrayRooms.count
    }
    func configureROOMSCells(cell: conversationCellView, for index: Int) {
        
        cell.setRoomImage(image: arrayRooms[index].sender_avatar)
        cell.setTime(time: arrayRooms[index].last_message_created_at)
        cell.setlastMessage(message: arrayRooms[index].last_message_content)
        cell.setUserName(userName: arrayRooms[index].sender_name)
      
    }
    
    func getRoomsData(){
        view?.showIndicator()
        TabBarinteractor.rooms.send(ConversationRoomsModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                self.arrayRooms = value.data.rooms
                
                self.view?.featchingData()
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
}
