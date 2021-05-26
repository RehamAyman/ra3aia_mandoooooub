//
//  registerByImgsVC.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import UIKit
import Kingfisher


class registerByImgsVC: UIViewController {
    
    
    
    let userPicker = UIImagePickerController()
    let idPicker = UIImagePickerController()
    let vhicelPicker = UIImagePickerController()
    let DrivingLicense = UIImagePickerController()
    
    var presenter : registerByImgs!
    
    var email = String()
    var password = String()
    var Fname = String()
    var Lname = String()
    var address = String()
    var phone = String()
    var uploadImge = [UploadData]()
   
    
   
    
//MARK:  -  OUTLETS
   
    @IBOutlet weak var car: curvedTextField!
    @IBOutlet weak var IDPic: UIImageView!
    @IBOutlet weak var vehiclePic: UIImageView!
    @IBOutlet weak var Userimg: UIImageView!
    @IBOutlet weak var drivingLicenesPIC: UIImageView!
    
    //MARK:- CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

       presenter = registerByImgs(view: self)
        presenter.viewDidLoad()
    }
    

   //MARK:- ACTIONS
    
    @IBAction func IDPicButton(_ sender: UIButton) {
       presenter.showIDImagePicker()
        //self.AddImageAlert()
    }
    @IBAction func VehiclePicButton(_ sender: UIButton) {
        presenter.showvhicleImagePicker()
     
    }
    
    @IBAction func DrivingPicButton(_ sender: UIButton) {
        presenter.DrivingLicensePicker()
       
    }
    
    @IBAction func personalPhotoButton(_ sender: UIButton) {
        presenter.ShowUserPicker()
     

    }
    
    
    
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        // car type
        // upload id image
        
        
//        presenter.RegisterNewDelegate(fname: Fname , lname:Lname ,email: email , phone: phone , password: password , carType: car.text ?? "" , address: address, Images: uploadImge )
        //presenter.gotoVervicationScreen()
        presenter.cheackData(fname: Fname, lname: Lname, email: email, phone: phone, password: password, address: address, carType: car.text ?? "" , Images: uploadImge)
        
    }
}
