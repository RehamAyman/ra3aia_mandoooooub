//
//  chaatModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/28/21.
//


import Foundation
struct chaatModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : ChaatData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }
}
struct ChaatData : Codable {
    let id : Int
    let order : Int
    let receiver_id : Int
    let receiver_avatar : String
    let receiver_name : String
    let receiver_phone : String
    let receiver_rate : String
    let delivery_price : String
    let user_id : Int
    let status : String
    let messages : [chatMessages]

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case order = "order"
        case receiver_id = "receiver_id"
        case receiver_avatar = "receiver_avatar"
        case receiver_name = "receiver_name"
        case receiver_phone = "receiver_phone"
        case receiver_rate = "receiver_rate"
        case delivery_price = "delivery_price"
        case user_id = "user_id"
        case status = "status"
        case messages = "messages"
    }
}

struct chatMessages : Codable {
    let id : Int
    let content : String
    let avatar : String
    let type : String
    let created_at : String
    let sent_by_me : Int

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case content = "content"
        case avatar = "avatar"
        case type = "type"
        case created_at = "created_at"
        case sent_by_me = "sent_by_me"
    }}
