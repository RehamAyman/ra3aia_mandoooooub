//
//  OrderRequsetsVC.swift
//  mandobRaaya
//
//  Created by Reham Ayman on 3/19/21.
//

import UIKit

import CoreLocation
import GooglePlaces
import GoogleMaps



class DeliveryReqVC: UIViewController {
    var presenter : DeliveryReqVCPresenter!
    var locationManager = CLLocationManager()
//    var lat = 31.0335251
//    var lng = 30.4552283
   
    // user lat never return value unused var
    static var UserLat:Double!
    static var UserLong :Double!
    
    

    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" ========== view did load =========")
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
     
             
    print(DeliveryReqVC.UserLat ?? "nil")
    print(DeliveryReqVC.UserLong ?? "nil")
        
        presenter = DeliveryReqVCPresenter(view: self)
         presenter.viewDidload()
     
       
        
        
      

    }
  
    
    
    
    override func viewWillAppear(_ animated: Bool) {

        print(" ========== viewWillAppear =========")
        print(getUserLat())
        print(getUserLong())
        
      
        presenter.getReqData(lat: getUserLat(), lng:  getUserLong())
      
        
        
        
    }
    


 

    @IBAction func NotificationsButton(_ sender: UIButton) {
        presenter.gotoNotificationVC()
    }
    @IBAction func MessageButton(_ sender: UIButton) {
        presenter.gotoConversationsScreen()
    }
    
   
  
  
       
  
  
    
}

extension DeliveryReqVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
           
            print("========================= got location ")
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            
            DeliveryReqVC.UserLat = location.coordinate.latitude
            DeliveryReqVC.UserLong = location.coordinate.longitude
            defaults.set(location.coordinate.latitude, forKey: User_Lat)
            defaults.set(location.coordinate.longitude, forKey: User_Lng)

            
        }
        
    }
    //30.95006734692955
  //  30.95006734692955
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("====== location error +++++++ ===== ")
        print(error)
        
    }
    
}
