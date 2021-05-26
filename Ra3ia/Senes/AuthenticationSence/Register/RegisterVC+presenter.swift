//
//  RegisterVC+presenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 3/24/21.
//

import UIKit
import ReCaptcha
extension RegisterVC : RegisterView  , selectDate  {
   
    
   
    
    func fetchingDataSuccess() {
        self.TypeCollectionView.reloadData()
        self.specCollectionView.reloadData()
    }
    
    func setupCollections() {
        TypeCollectionView.delegate = self
        TypeCollectionView.dataSource = self
        specCollectionView.delegate = self
        specCollectionView.dataSource = self
        TypeCollectionView.register(UINib(nibName: "TypeCell", bundle: nil), forCellWithReuseIdentifier: "TypeCell")
        specCollectionView.register(UINib(nibName: "specCell", bundle: nil), forCellWithReuseIdentifier: "specCell")
    }
    
    
    
    
    func setupReCaptcha() {
        self.recaptcha?.configureWebView { [weak self] webview in
               webview.frame = self?.view.bounds ?? CGRect.zero
           }
    }
    
    
    func PresentSelectDate() {
        if let vc = storyboard?.instantiateViewController(identifier: "SelectBirthDateVC") as? SelectBirthDateVC {
            
            vc.delgate = self
            
            present(vc, animated: true, completion: nil)
            
        }}
    
  
    
    
    func GoToHomePage() {
        if let vc = storyboard?.instantiateViewController(identifier: "") as? HomeVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func selectedDate(date: String) {
           self.BirthDateTextField.text = "\(date)"
          
       }
    
 
       
    
    
    }

extension RegisterVC  {
    
    
    func recaptchavalidate() {
        recaptcha?.validate(on: view) { [weak self] (result: ReCaptchaResult) in
            
           print(try? result.dematerialize())
            
        }
        
    
    }
    
}
