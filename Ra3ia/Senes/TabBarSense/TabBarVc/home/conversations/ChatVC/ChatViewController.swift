//
//  ChatViewController.swift
//  Ra3ia
//
//  Created by Sara Mady on 25/05/2021.
//

import UIKit
import Cosmos
import AVKit
class ChatViewController: UIViewController ,UITextViewDelegate{
    
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFeild: UITextView!
    @IBOutlet weak var secondUserRate: CosmosView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPrice: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderID: UILabel!
 
    @IBOutlet weak var orderDataStack: UIStackView!
    //@IBOutlet weak var stackHeight: NSLayoutConstraint!
    @IBOutlet weak var userDetils: UIView!
    @IBOutlet weak var userDetilsHeight: NSLayoutConstraint!
    @IBOutlet weak var userImage: UIImageView!
  

 

    @IBOutlet weak var optionView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    
    var player: AVAudioPlayer!
    var player2:AVAudioPlayer = AVAudioPlayer()
    var recorder: AVAudioRecorder!
    var soundFileURL: URL!
    var reciveID = 0
    var Prisnter:ChatPrisnter!
    var roomID = 0
    var isProvider = false
    var isAdvertsment = false
    var phonNumber = ""
    var UserChatData : ChaatData!
    var uploadImge = [UploadData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.optionView.isHidden = true
        Prisnter = ChatPrisnter(view:self)
        self.secondUserRate.isUserInteractionEnabled = false
        self.textFeild.delegate = self
        self.textView.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0, y: -2, blur: 5, spread: 0)
        self.userDetils.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0 , y: 3, blur: 5, spread: 0)
       
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Prisnter.viewDidLoad(roomId:self.roomID)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendAction(_ sender: Any) {
        if(self.textFeild.text.isEmpty == true){
            self.sendButton.backgroundColor = UIColor.red
            self.sendButton.setImage(#imageLiteral(resourceName: "microphone-black-shape"), for: .normal)
            
            UIView.animate(withDuration: 0.6,animations: {
                self.sendButton.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            },completion:nil)
            
            if player != nil && player.isPlaying {
                print("stopping")
                player.stop()
            }
            if recorder != nil && recorder.isRecording {
                print("pausing")
                recorder.pause()} else {
                print("recording")
                recordWithPermission(true)
            }
        }
    }
    
    @IBAction func sentAction(_ sender: Any) {
        if(self.textFeild.text.isEmpty == true){
         self.sendButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.35)
         UIView.animate(withDuration: 0.6,animations: {
             self.sendButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
             self.sendButton.setImage(#imageLiteral(resourceName: "microphone-black-shape"), for: .normal)
            self.sendButton.backgroundColor = UIColor.BasicColor

         },completion:nil)
         recorder?.stop()

         player?.stop()
        }else{
            Prisnter.sendMessages(message: self.textFeild.text ?? "", type: "text")
            self.sendButton.setImage(#imageLiteral(resourceName: "microphone-black-shape"), for: .normal)
        }
    }
    
    

    @IBAction func createContractAction(_ sender: Any) {
        Prisnter.goToContractPage()
    }
    
    @IBAction func callAction(_ sender: Any) {
        
        guard let url = URL(string: "tel://\(self.phonNumber)") else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if(textFeild.text!.isEmpty == true){
            self.sendButton.setImage(#imageLiteral(resourceName: "microphone-black-shape"), for: .normal)
        }else{
            if(AppLanguage.currentLanguage().contains("ar")){
                self.sendButton.setImage(#imageLiteral(resourceName: "send"), for: .normal)

            }else{
                self.sendButton.setImage(#imageLiteral(resourceName: "send"), for: .normal)

            }
        }
    }
        
    @IBAction func moreAction(_ sender: Any) {
        self.optionView.isHidden = false
    }
    @IBAction func payAction(_ sender: Any) {
//        if(UserChatData.order_status_ == "orderAccepted"){
//            Prisnter.CancelOrder(id: UserChatData.order_id ?? 0)
//        }else{
//            if(UserChatData.payment_type == "wallet"){
//                Prisnter.payWithWallet(id: UserChatData.order_id ?? 0)
//
//            }else if(UserChatData.payment_type == "online"){
//                let vc = Storyboard.Main.viewController(PayWebViewController.self)
//                vc.id = UserChatData.order_id
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
    }
    
    @IBAction func TrackAction(_ sender: Any) {
//        self.dismissKeyboard()
//        self.optionView.isHidden = true
//        let vc = Storyboard.Main.viewController(TrackViewController.self)
//        vc.ResiverLat = Double(self.UserChatData.receiver_lat ?? "0.0")
//        vc.ResiverLong = Double(self.UserChatData.receiver_lng ?? "0.0" )
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func addImageAction(_ sender: Any) {
        self.AddImageAlert()
    }
    
    @IBAction func addAdresAction(_ sender: Any) {
        self.dismissKeyboard()
        self.optionView.isHidden = true
        let vc = Storyboard.Main.viewController(ComplaintsVC.self)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



extension ChatViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("\(#function)")
        
        print("finished playing \(flag)")
        
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("\(#function)")
        
        if let e = error {
            print("\(e.localizedDescription)")
        }
        
    }
}
extension ChatViewController: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,
                                         successfully flag: Bool) {
        
        
        if let multiPart = try? Data(contentsOf: self.recorder.url){
            print("💙\(multiPart)")
            API.POSTSound(url: "https://raaia.4hoste.com/api/upload-file", sound: multiPart , Keys: "file", header: ["Authorization":"Bearer" + (User.currentUser?.token!)!,"lang":AppLanguage.getLang()], parameters: [:]) { (succss, value) in
                print("👏🏻\(value)")
                if value["data"] as? [String:Any] != nil {
                    let data = value["data"] as? [String:Any]
                    let url = data!["url"] as? String
                    let name = data!["name"] as? String
                    // self.Massges[self.Massges.count - 1].content = url!
                    print("💙\(url)")

                    self.tableView.reloadData()
                  
                    self.Prisnter.sendMessages(message: name!, type: "sound")
//                    SocketConnection.sharedInstance.socket.emit("send-file", test)
                    self.tableView.reloadData()
                   // self.GetLastMassge()
                    self.recorder = nil
                }
                
            }
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder,
                                          error: Error?) {
        print("\(#function)")
        
        if let e = error {
            print("\(e.localizedDescription)")
        }
    }
    
}
extension AVPlayer {
    
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
    
}
