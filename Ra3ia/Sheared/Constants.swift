//
//  Constants.swift
//  SeaTrips
//
//  Created by Sara Mady on 21/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit
let defaults = UserDefaults.standard
let Lang_ar = "ar"
let Lang_en = "en"
let textFiledWidth = ((UIScreen.main.bounds.width)/1.2)
let iosMinumumLocalizationMirror  = "10"
let NotficationStatus  = "NotficationStatus"
let userType = ""
let User_Lat  = "User_Lat"
let User_Lng  = "User_Lng"



func getNotficationStatus() -> String{
    
    if  UserDefaults.standard.object(forKey: NotficationStatus) != nil{
        return  String(UserDefaults.standard.string(forKey: NotficationStatus)!)

    }else{
        return  "open"

    }
}

func getUserType() -> String{
    
    
        return  String(UserDefaults.standard.string(forKey: userType)!)

    
}

func getUserLat() -> Double{
    if  UserDefaults.standard.object(forKey: User_Lat) != nil{
        return  Double(UserDefaults.standard.double(forKey: User_Lat))

    }else{
        return 31.0335251
    }
}
func getUserLong() -> Double{
   if  UserDefaults.standard.object(forKey: User_Lng) != nil{
        return  Double(UserDefaults.standard.double(forKey: User_Lng))

    }else{
        return 30.4552283
    }
}
