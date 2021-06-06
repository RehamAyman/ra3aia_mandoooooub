//
//  ChatVC+Prisnter.swift
//  SeaTrips
//
//  Created by Sara Mady on 03/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import AVKit
import SKActivityIndicatorView
extension ChatViewController:ChatView


{
//    func finishPassing(location: String, lat: Double, lng: Double, isRecive: String) {
//        let l = LocationMapModel(lat: lat, addresse: location, lang: lng)
//        let activitesData = try? JSONSerialization.data(withJSONObject: l.toDic(), options: [])
//        let activitiesDataJson = String(data: activitesData!, encoding: String.Encoding.utf8)
//        Prisnter.sendMessages(message: activitiesDataJson!, type: "map")
//    }
    
    
   

    
//    func goToContractPage(contarctID: Int, data: ChatData) {
//        let vc = Storyboard.Main.viewController(AgrementViewController.self)
//        vc.contractID = contarctID
//        vc.UserChatData = data
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    func showSuccessMessage(msg:String){
        showSuccessAlert(title: "", message: msg)
    }
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
    
    func GetLastMassge(MessagesArray : [chatMessages]) {
        if MessagesArray.count != 0 {
            let i = IndexPath(row: 0, section: MessagesArray.count-1)
            self.tableView.scrollToRow(at: i , at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    func setChatData(data: ChaatData) {
        self.userName.text = data.receiver_name
        self.userImage.setImageWith(data.receiver_avatar)
        self.userPrice.text =  data.delivery_price + " " + "SR".localized
        self.secondUserRate.rating = Double(data.receiver_rate) ?? 0.0
        self.orderStatus.text = data.status
        self.orderStatus.clipsToBounds = true
        self.orderID.text = "#  " +  String(data.id)
        self.phonNumber = data.receiver_phone
        UserChatData = data
//        if(data.order  == "intercity_delivery"){
//            self.orderDataStack.isHidden = false
//        }else{
//            self.orderDataStack.isHidden = true
//        }
        
//        if(data.order_type == "" || data.order_type == "advertisement"){
//            self.userPrice.text = String( data.contractPrice ?? "0.0") + " " + "SR".localized
//
//            self.billButton.isHidden = false
//            notfiView.isHidden = false
//        }else{
//            self.billButton.isHidden = true
//            notfiView.isHidden = true
//        }
        
//        if(data. == "false" && data.contractPrice == "0" || data.contractPrice == ""){
//            self.billButton.isHidden = true
//            notfiView.isHidden = true
//            self.paymentView.isHidden = true
//            self.heightOfView.constant = 0
//        }else if(data.advertisement_is_mine == "false" && data.contractPrice != "0"){
//            self.billButton.isHidden = false
//            notfiView.isHidden = false
//        }else if(data.advertisement_is_mine == "false" && data.contract_id == 0){
//            notfiView.isHidden = true
//            self.billButton.isHidden = true
//            notfiView.isHidden = true
//
//        }else if(data.advertisement_is_mine == "true" ){
//            notfiView.isHidden = true
//        }
//
//        if(data.order_status_ == "orderAccepted"){
//            self.paymentTitle.text = "Do you want to cancel the order?".localized
//            self.paymentView.backgroundColor = #colorLiteral(red: 1, green: 0.3008484656, blue: 0.2951980984, alpha: 1)
//            self.payButton.setTitle("Cancel".localized, for: .normal)
//        }else{
//            if(data.payment_status == "false" && data.order_id != 0){
//                self.paymentView.isHidden = false
//                self.heightOfView.constant = 60
//                self.paymentTitle.text =  "Payment of the order cost".localized
//                self.paymentView.backgroundColor = #colorLiteral(red: 0.8703849912, green: 0.8079047799, blue: 0.7006062865, alpha: 0.6658027286)
//                self.payButton.setTitle("Pay".localized, for: .normal)
//            }else{
//                self.paymentView.isHidden = true
//                self.heightOfView.constant = 0
//            }
//
//            if( UserChatData.payment_type == "cash"){
//                self.paymentView.isHidden = true
//                self.heightOfView.constant = 0
//            }
//        }
//
    }
    
    func recordWithPermission(_ setup: Bool) {
        print("\(#function)")
        
        AVAudioSession.sharedInstance().requestRecordPermission {
            [unowned self] granted in
            if granted {
                
                DispatchQueue.main.async {
                    print("Permission to record granted")
                    self.setSessionPlayAndRecord()
                    if setup {
                        self.setupRecorder()
                    }
                    
                    self.recorder.record()
                    
                }
            } else {
                print("Permission to record not granted")
            }
        }
        
        if AVAudioSession.sharedInstance().recordPermission == .denied {
            print("permission denied")
        }
    }
    
    func setupRecorder() {
        let format = DateFormatter()
        format.dateFormat="yyyy-MM-dd-HH-mm-ss"
        let currentFileName = "recording-\(format.string(from: Date())).m4a"
        print("🖍\(currentFileName)")
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.soundFileURL = documentsDirectory.appendingPathComponent(currentFileName)
        print("writing to soundfile url: '\(soundFileURL!)'")
        if FileManager.default.fileExists(atPath: soundFileURL.absoluteString) {
            // probably won't happen. want to do something about it?
            print("soundfile \(soundFileURL.absoluteString) exists")
        }
        
        let recordSettings: [String: Any] =
            [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            recorder = try AVAudioRecorder(url: soundFileURL, settings: recordSettings)
            recorder.delegate = self as! AVAudioRecorderDelegate
            recorder.isMeteringEnabled = true
            recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
        } catch {
            recorder = nil
            print(error.localizedDescription)
        }
        
    }
    
    func setSessionPlayAndRecord() {
        print("\(#function)")
        
        let session = AVAudioSession.sharedInstance()
        do {
            //try session.setCategory(AVAudioSession.Category.playAndRecord)
            //    try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
            try session.setCategory(AVAudioSession.Category.playAndRecord, options: .defaultToSpeaker)
            
        } catch {
            print("could not set session category")
            print(error.localizedDescription)
        }
        
        do {
            try session.setActive(true)
        } catch {
            print("could not make session active")
            print(error.localizedDescription)
        }
    }
    
    
    
}
