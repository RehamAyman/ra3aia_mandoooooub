//
//  requestsModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/29/21.
//

import Foundation
struct requestsModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : [requestsData]

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }

  

}
struct requestsData : Codable {
    let id : Int
    let type : String
    let type_ : String
    let receive_address : String
    let deliver_address : String
    let animal : String
    let created_at : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case type = "type"
        case type_ = "type_"
        case receive_address = "receive_address"
        case deliver_address = "deliver_address"
        case animal = "animal"
        case created_at = "created_at"
    }

  

}
