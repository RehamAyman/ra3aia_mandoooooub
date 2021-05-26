//
//  profileModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/29/21.
//

import Foundation


struct profileModel : Codable ,CodableInit  {
    let key : String?
    let code : Int?
    let data : ProfileData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
        
    }
  

}

struct ProfileData : Codable {
    let status : String
    let id : Int
    let toggleNotifications : Int
    let avatar : String
    let acc_type : String
    let fname : String
    let lname : String
    let name : String
    let email : String
    let birthday : String?
    let phone : String
    let connected : String
    let bio : String?
    let specialties : [String]
    let animals : [String]
    let experiences : [String]
    let auction_name : String
    let lat : String
    let lng : String
    let address : String
    let id_image : String
    let auction_views : Int
    let auction_members : Int
    let car_image : String
    let licence_image : String
    let car_type : String

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case id = "id"
        case toggleNotifications = "toggleNotifications"
        case avatar = "avatar"
        case acc_type = "acc_type"
        case fname = "fname"
        case lname = "lname"
        case name = "name"
        case email = "email"
        case birthday = "birthday"
        case phone = "phone"
        case connected = "connected"
        case bio = "bio"
        case specialties = "specialties"
        case animals = "animals"
        case experiences = "experiences"
        case auction_name = "auction_name"
        case lat = "lat"
        case lng = "lng"
        case address = "address"
        case id_image = "id_image"
        case auction_views = "auction_views"
        case auction_members = "auction_members"
        case car_image = "car_image"
        case licence_image = "licence_image"
        case car_type = "car_type"
    }

    

}
