//
//  selectTimeVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/7/21.
//

import UIKit
protocol selecttime {
        func selectedtime(date:String)
    }

class selectTimeVC: UIViewController {
    var delgate:selecttime!

    @IBOutlet weak var picker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

    @IBAction func timePicker(_ sender: UIDatePicker) {
        
        }

    @IBAction func confirm(_ sender: UIButton) {
        //hh:mm a
      
       
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.dateFormat = "hh:mm a"
        self.delgate.selectedtime(date:  timeFormatter.string(from:picker.date))
        
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cansel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
