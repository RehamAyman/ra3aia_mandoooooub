//
//  chatVC+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/28/21.
//

import Foundation
import SKActivityIndicatorView
extension ChatViewController:ChatView{
   
    
    func EmptyMessageText() {
        self.textFeild.text = ""
    }
    func goToNextPage(resirvId: Int) {
        
    }
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    func showIndicator() {
        SKActivityIndicator.show()
    }
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    func FeatchData() {
        self.tableView.reloadData()
    }
    
    func GetLastMassge(MessagesArray: [chatMessages]) {
        if MessagesArray.count != 0 {
            let i = IndexPath(row: 0, section: MessagesArray.count-1)
            self.tableView.scrollToRow(at: i , at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    func setUpViews () {
       
            self.infoView.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0 , y: 3, blur: 5, spread: 0)
        
        
      
            self.chatView.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0, y: -2, blur: 5, spread: 0)
        self.avatar.MakeRounded()
        
    }
    func featchrecData(data: ChaatData) {
        self.rate.rating = Double (data.receiver_rate) ?? 0.0
        self.userName.text = data.receiver_name
        self.cost.text = data.delivery_price
        self.avatar.setImageWith(data.receiver_avatar)
        self.number.text = String (data.order)
        self.status.text = data.status
        
    }
    
    
}
