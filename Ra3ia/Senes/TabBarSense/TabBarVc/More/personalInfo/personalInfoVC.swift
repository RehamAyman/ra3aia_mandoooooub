//
//  personalInfoVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/5/21.
//

import UIKit
import SPAlert



class personalInfoVC: UIViewController {
    let imagePicker = UIImagePickerController()
    let idPicker = UIImagePickerController()
    let vhicelPicker = UIImagePickerController()
    let DrivingLicense = UIImagePickerController()
    
    var presenter : personalInfoVcPresenter!
    var uploadImge = [UploadData]()
    
    
    //MARK:- OUTLETS
    
   
    @IBOutlet weak var userNameLBL: UILabel!
   
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var emailTXtField: UITextField!
    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var submitOutlet: UIButton!
    @IBOutlet weak var userImage:UIImageView!
    @IBOutlet weak var vehiclePic: UIImageView!
    @IBOutlet weak var IDpic: UIImageView!
    @IBOutlet weak var editVhicleOutlet: UIButton!
    @IBOutlet weak var editDrivingOutlet: UIButton!
    @IBOutlet weak var editIdOutlet: UIButton!
    @IBOutlet weak var drivingPic: UIImageView!
    
    
    //MARK:- CYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter  = personalInfoVcPresenter(view: self)
       
        presenter.viewDidLoad()

       

    }
    


    //MARK:- IBACTIONS

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editUserImage(_ sender: UIButton) {
        presenter.editUserImage()
        }
        
    @IBAction func editPassword(_ sender: UIButton) {
       // go to edit password screen
        presenter.GoToEditPassword()
    
        
    }
    
    @IBAction func editInfo(_ sender: UIButton) {
       makeIsEditble()
    }
    
  
    @IBAction func editOtherImages(_ sender: UIButton) {
        self.submitOutlet.isHidden = false
        presenter.showEditLicenseBtn()
        presenter.ShowEditVhicleBtn()
        presenter.showEditIDImagesBtn()
    }
    
    
    @IBAction func EditIDPic(_ sender: UIButton) {
        presenter.showIDImagePicker()
        presenter.hideEditIDImagesBtn()
    }
    
    @IBAction func editDrivingPic(_ sender: UIButton) {
        presenter.DrivingLicensePicker()
        presenter.hideEditLicenseBtn()
    }
    
    @IBAction func editVehiclePic(_ sender: UIButton) {
        presenter.showvhicleImagePicker()
        presenter.hideEditVhicleBtn()
       
    }
    @IBAction func submit(_ sender: UIButton) {
        presenter.CheackData(fname: userNameTxtField.text ?? "", lname: lastNameTextField.text ?? "" , email: emailTXtField.text ?? "" , phone: phoneNumTxtField.text ?? "" , image: self.uploadImge)
        
    }
    
}
