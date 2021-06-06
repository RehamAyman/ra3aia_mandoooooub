//
//  OrdersDetailsCell.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/19/21.
//

import UIKit

class OrdersDetailsCell: UITableViewCell , OrdersCellsView {
    func setRequestNum(num: String) {
        self.requestNumber.text = num
    }
    
    func configCitiesDelivery() {
        detailsView.backgroundColor = .white
        toLocationLbl.textColor = .darkGray
        FromLocationLbl.textColor = .darkGray
        animalLabel.textColor = .darkGray
        dateLabel.textColor = .darkGray
        dateIcon.image = UIImage(named: "clockb")
        dateIcon.tintColor = UIColor(named: "BaseColour")
        requestNumber.textColor = UIColor(named: "BaseColour")

        
        animalIcon.image = UIImage(named: "boxor")
        toLocIcon.image = UIImage(named: "noun_loc_o")
        fromLocIcon.image = UIImage(named: "noun_loc_o")
    }
    
    func ConfigOtherRequests() {
        detailsView.backgroundColor = UIColor(named: "BaseColour")
        toLocationLbl.textColor = .white
        FromLocationLbl.textColor = .white
        animalLabel.textColor = .white
        dateLabel.textColor = .white
        requestNumber.textColor = .white
        
        
        dateIcon.image = UIImage(named: "clock")
        animalIcon.image = UIImage(named: "box")
        toLocIcon.image = UIImage(named: "noun_loca")
        fromLocIcon.image = UIImage(named: "noun_loca")
    }
    
  
    //MARK: - outlets
    
    @IBOutlet weak var requestNumber: UILabel!
    @IBOutlet weak var toLocationLbl: UILabel!
    @IBOutlet weak var FromLocationLbl: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var dateIcon: UIImageView!
    @IBOutlet weak var animalIcon: UIImageView!
    @IBOutlet weak var fromLocIcon: UIImageView!
    @IBOutlet weak var toLocIcon: UIImageView!
    

    
    //MARK:-  lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
      
        selectionStyle = .none
        //  Note : inherit from shared folder -> classes
    
        view.layer.applySketchShadow(color: .lightGray, alpha: 0.7, x: 0, y: 0, blur: 7, spread: 0)
        detailsView.addTopLeftCoreners(num: 20)
        
    
    }
    
 
    
    
    //MARK: - IBActions
    
    @IBAction func DetailsButton(_ sender: UIButton) {
        
    }
    // protocols
    
    func setToLocation(Location: String) {
        self.toLocationLbl.text = Location
          
      }
      
      func setFromLocation(location: String) {
        self.FromLocationLbl.text = location
          
      }
      
      func SetDate(date: String) {
        self.dateLabel.text = date
          
      }
      
      func SetAnimalType(AnimalType: String) {
        self.animalLabel.text = AnimalType
          
      }
    
    
//
//    func configoddCells() {
//        detailsView.backgroundColor = .white
//        toLocationLbl.textColor = .darkGray
//        FromLocationLbl.textColor = .darkGray
//        animalLabel.textColor = .darkGray
//        dateLabel.textColor = .darkGray
//        dateIcon.image = UIImage(named: "clockb")
//        dateIcon.tintColor = UIColor(named: "BaseColour")
//
//
//        animalIcon.image = UIImage(named: "boxor")
//        toLocIcon.image = UIImage(named: "noun_loc_o")
//        fromLocIcon.image = UIImage(named: "noun_loc_o")
//    }
//    func configevenCells() {
//       detailsView.backgroundColor = UIColor(named: "BaseColour")
//       toLocationLbl.textColor = .white
//       FromLocationLbl.textColor = .white
//       animalLabel.textColor = .white
//       dateLabel.textColor = .white
//       dateIcon.image = UIImage(named: "clock")
//       animalIcon.image = UIImage(named: "box")
//       toLocIcon.image = UIImage(named: "noun_loca")
//       fromLocIcon.image = UIImage(named: "noun_loca")
//    }
//
}
