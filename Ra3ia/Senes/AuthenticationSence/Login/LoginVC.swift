//
//  LoginVC.swift
//  Ra3ia
//
//  Created by Sara Mady on 24/03/2021.
//


import UIKit

class LoginVC: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var mobileNumber: curvedTextField!
    @IBOutlet weak var password: curvedTextField!
    
    
    //MARK: - Varibles
    
    
    var presenter:LoginVcPresnter!
    
    //MARK : - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        presenter = LoginVcPresnter(view: self)
        presenter.viewDidLoad()
    }
    //MARK: - IBACTIONS
    
    @IBAction func Login(_ sender: UIButton) {
        
        
        self.presenter.cheackValidData(mobile: self.mobileNumber.text ?? "", password: self.password.text ?? "", device_id: AppDelegate.FCMTOKEN)
        
//        guard let window = UIApplication.shared.keyWindow else { return }
//        let vc = Storyboard.Main.initialViewController()
//        window.rootViewController = vc
//
      // presenter.gotoHomeScreen()
//
    }

    
    @IBAction func ForgetPassword(_ sender: UIButton) {
        presenter.gortoForgetPassword()
      
        
    }
   
    @IBAction func register(_ sender: UIButton) {
        presenter.GotoRegisterScreen()
        
    }
    
    
    
}
