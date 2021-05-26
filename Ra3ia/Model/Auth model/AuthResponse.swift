//
//  AuthResponse.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/23/21.
//

import Foundation


struct AuthResponse: Codable ,CodableInit{
    let key: String
    let code: Int?
    let data: User
   
    
}


struct User : Codable {
    let token : String?
    let status : String?
    let id : Int?
    let toggleNotifications : Int?
    let avatar : String?
    let acc_type : String?
    let fname : String?
    let lname : String?
    let name : String?
    let email : String?
    let birthday : String?
    let phone : String?
    let connected : String?
    let bio : String?
    let specialties : [String]?
    let animals : [String]?
    let experiences : [String]?
    let auction_name : String?
    let lat : String?
    let lng : String?
    let address : String?
    let id_image : String?
    let auction_views : Int?
    let auction_members : Int?
    let car_image : String?
    let licence_image : String?
    let car_type : String?

    enum CodingKeys: String, CodingKey {

        case token = "token"
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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        toggleNotifications = try values.decodeIfPresent(Int.self, forKey: .toggleNotifications)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        acc_type = try values.decodeIfPresent(String.self, forKey: .acc_type)
        fname = try values.decodeIfPresent(String.self, forKey: .fname)
        lname = try values.decodeIfPresent(String.self, forKey: .lname)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        connected = try values.decodeIfPresent(String.self, forKey: .connected)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        specialties = try values.decodeIfPresent([String].self, forKey: .specialties)
        animals = try values.decodeIfPresent([String].self, forKey: .animals)
        experiences = try values.decodeIfPresent([String].self, forKey: .experiences)
        auction_name = try values.decodeIfPresent(String.self, forKey: .auction_name)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        id_image = try values.decodeIfPresent(String.self, forKey: .id_image)
        auction_views = try values.decodeIfPresent(Int.self, forKey: .auction_views)
        auction_members = try values.decodeIfPresent(Int.self, forKey: .auction_members)
        car_image = try values.decodeIfPresent(String.self, forKey: .car_image)
        licence_image = try values.decodeIfPresent(String.self, forKey: .licence_image)
        car_type = try values.decodeIfPresent(String.self, forKey: .car_type)
    }

}
    
    
   
extension User {
    static var currentUser: User? {
        
        get {
            let userDefaults = UserDefaults.standard
            let decoder = JSONDecoder()
            guard let savedPerson = userDefaults.object(forKey: UserDefaultsKeys.user.rawValue) as? Data, let loadedPerson = try? decoder.decode(User.self, from: savedPerson) else { return nil }
            return loadedPerson
        }set {
            let userDefaults = UserDefaults.standard
            guard let value = newValue else {
                userDefaults.set(nil, forKey: UserDefaultsKeys.user.rawValue)
                return
            }
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(value) {
                userDefaults.set(encoded, forKey: UserDefaultsKeys.user.rawValue)
            }
        }
    }
}

enum UserDefaultsKeys: String {
    case user
}


