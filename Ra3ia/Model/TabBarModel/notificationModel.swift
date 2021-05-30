//
//  notificationModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/27/21.
//


import Foundation
struct notificationModel : Codable , CodableInit{
    let key : String
    let code : Int
    let data : [notificationData]

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }

  

}

struct notificationData : Codable {
    let id : Int
    let title : String
    let content : String
    let auction_id : Int
    let product_id : Int
    let order_id : Int
    let room_id : Int
    let prescription_id : Int
    let advertisement_id : Int
    let contract_id : Int
    let type : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case content = "content"
        case auction_id = "auction_id"
        case product_id = "product_id"
        case order_id = "order_id"
        case room_id = "room_id"
        case prescription_id = "prescription_id"
        case advertisement_id = "advertisement_id"
        case contract_id = "contract_id"
        case type = "type"
    }}
