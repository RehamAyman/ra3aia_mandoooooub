//
//  chaatPresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/28/21.
//

import Foundation
import UIKit
import Alamofire

protocol  ChatView: class {
    func goToNextPage(resirvId:Int)
    func showError(error:String)
    func showIndicator()
    func hideIndicator()
    func FeatchData()
    func GetLastMassge(MessagesArray : [chatMessages])
    func EmptyMessageText()
    func featchrecData( data : ChaatData)
}

protocol  ChatCellView: class {
 
    func setImage(image:String,bool:Int)
    func setContent(msg:String)
}


class ChatPrisnter {
    private weak var view: ChatView?
    
    var MessagesArray = [chatMessages]()
    var roomId = ""
    var receiverId = ""
    
    init(view:ChatView) {
        self.view = view
    }
    
   
    func viewDidLoad(roomId:Int){
        self.showChatData(roomId: roomId)
    }
    func viewwillDisApper(){
        SocketConnection.sharedInstance.socket.off("newMessage")
        SocketConnection.sharedInstance.socket.emit("exitChat", with: []) {
            print("added user id \(String(User.currentUser?.id ?? 0))")
        }
    }
    
    
    func CellConfigeration(cell:ChatCellView,for Index:Int){
      
        cell.setImage(image: self.MessagesArray[Index].avatar,bool: self.MessagesArray[Index].sent_by_me)
        cell.setContent(msg: self.MessagesArray[Index].content)
    }
    
    func getMessagesnCount() -> Int{
        return self.MessagesArray.count
    }
    
    func ConnectToSocket(roomId:String) {
        if SocketConnection.sharedInstance.socket.status == .connected{
            let dic = [
                "room_id":"\(roomId)",
                "user_id":"\(String(User.currentUser?.id ?? 0))",
                
                ] as [String : Any]
            SocketConnection.sharedInstance.socket.emit("adduser", with: [dic]) {
              self.SockeConFigration()
                
            }
        }
        SocketConnection.sharedInstance.socket.on(clientEvent: .connect) { (data, ack) in
            print("🍋Connect")
            print("🍉\(data)")
           self.SockeConFigration()
            
        }
        SocketConnection.sharedInstance.socket.on(clientEvent: .error) { (data, ack) in
            print("🍋Error")
            print("🍉\(data)")
        }
        
        SocketConnection.sharedInstance.socket.on(clientEvent: .disconnect) { (data, ack) in
            print("🍋disconnect")
            print("🍉\(data)")
        }
        SocketConnection.sharedInstance.socket.on(clientEvent: .ping) { (data, ack) in
            print("🍋Ping")
            print("🍉\(data)")
        }
        
        SocketConnection.sharedInstance.socket.on(clientEvent: .reconnect) { (data, ack) in
            print("🍋reconnect")
            print("🍉\(data)")
        }
    }
    
    
    func SockeConFigration(){
        SocketConnection.sharedInstance.socket.on("newMessage") { (data, ack) in
            print("🌻\(data)")
            let dict = data[0] as! [String: Any]
            print("💙\(dict["message"] as? String ?? "")")
            
            self.MessagesArray.append(chatMessages(id: 0, content: dict["message"] as? String ?? "", avatar: User.currentUser?.avatar ?? "", type: "" ,created_at: "", sent_by_me: 1))

            self.view?.FeatchData()
            self.view?.GetLastMassge(MessagesArray: self.MessagesArray)
            }
    
    }
   
    func sendMessages(message:String){
        if(message != ""){
            self.MessagesArray.append(chatMessages(id: 0, content: message, avatar: User.currentUser?.avatar ?? "", type: "" ,created_at: "", sent_by_me: 1))

            let test = ["sender_id": String(User.currentUser?.id ?? 0), "receiver_id": self.receiverId,"room_id":self.roomId,"content":message] as [String : Any]

             SocketConnection.sharedInstance.socket.emit("sendMessage", test)
            self.view?.FeatchData()

            self.view?.GetLastMassge(MessagesArray: self.MessagesArray)
            self.view?.EmptyMessageText()
        }
    }
    
   
    
    func showChatData(roomId:Int){
        view?.showIndicator()
        TabBarinteractor.delegateSingleRoom(id:roomId).send(chaatModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                
                print("unAuthorized")
                
            case .failure(let error):
                
                showNoInterNetAlert()
                print("failure\(String(describing: error))")
                
            case .success(let value):
                self.MessagesArray = value.data.messages
                self.roomId = String(value.data.id)
                self.receiverId = String(value.data.receiver_id)
                self.view?.FeatchData()
                self.view?.GetLastMassge(MessagesArray: self.MessagesArray)
                self.view?.featchrecData(data: value.data)
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }
   
}
