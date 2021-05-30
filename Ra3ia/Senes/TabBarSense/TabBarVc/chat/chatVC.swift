//
//  chatVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/28/21.
//



import UIKit
import Cosmos

class ChatViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var call: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFeild: UITextField!
    
    @IBOutlet weak var chatView: UIView!
    
    @IBOutlet weak var infoView: UIView!
    
    var reciveID = 0
    var Prisnter:ChatPrisnter!
    var roomID = 0
    var isProvider = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        Prisnter = ChatPrisnter(view:self)
        Prisnter.viewDidLoad(roomId:self.roomID)
        self.setUpViews()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        Prisnter.viewwillDisApper()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Prisnter.ConnectToSocket(roomId: String(roomID))
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendAction(_ sender: Any) {
        Prisnter.sendMessages(message: self.textFeild.text ?? "")
    }
    
   
    
}
