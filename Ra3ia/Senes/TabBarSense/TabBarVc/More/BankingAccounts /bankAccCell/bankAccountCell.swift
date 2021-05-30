//
//  bankAccountCell.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/6/21.
//

import UIKit

class bankAccountCell: UITableViewCell , BankAccountsCellView {
    

    @IBOutlet weak var ibanNumber: UILabel!
    @IBOutlet weak var bankNumber: UILabel!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankImage: UIImageView!
    var delteAction : (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
       
    }

    func setBankImage(image: String) {
        self.bankImage.setImageWith(image)
            
        }
        
    func setBankName(name: String) {
        self.bankName.text = name
        }
        
    func setAccountNumber(num: String) {
        self.bankNumber.text = num
        }
        
    func setIbanNumber(num: String) {
        self.ibanNumber.text = num
            
        }
        

    @IBAction func deleteAction(_ sender: UIButton) {
        self.delteAction?()
    }
}

