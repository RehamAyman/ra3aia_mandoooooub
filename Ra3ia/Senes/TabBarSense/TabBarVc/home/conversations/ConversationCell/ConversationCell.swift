//
//  ConversationCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/8/21.
//

import UIKit

class ConversationCell: UITableViewCell , conversationCellView {


    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.userImage.MakeRounded()
    }

    func setRoomImage(image: String) {
        self.userImage.setImageWith(image)
    }
    
    func setlastMessage(message: String) {
        self.message.text = message
    }
    
    func setTime(time: String) {
        self.time.text = time
    }
    
    func setUserName(userName: String) {
        self.usernameLbl.text = userName
    }
    

}
