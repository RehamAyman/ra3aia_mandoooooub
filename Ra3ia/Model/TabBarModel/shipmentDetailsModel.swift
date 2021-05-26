//
//  shipmentDetailsModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/7/21.
//

import Foundation
struct ShipmentDetailsModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : ShipmentData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }
}
struct ShipmentData : Codable {
    
        let id : Int?
        let type : String?
        let type_ : String?
        let user_name : String?
        let user_phone : String?
        let room_id : Int?
        let animal : String?
        let deliver_address : String?
        let place_name : String?
        let receive_address : String?
        let delivery_price : String?
        let go_to_service_center_now : String?
        let delegate_status : String?
        let status : String?
        let desc : String?
        let date : String?
        let time : String?
        let payment_type : String?
        let payment_type_ : String?
        let delivery_type : String?
        let payment_status : String?
        let images : [ShipmentImages]?
        let created_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case type = "type"
            case type_ = "type_"
            case user_name = "user_name"
            case user_phone = "user_phone"
            case room_id = "room_id"
            case animal = "animal"
            case deliver_address = "deliver_address"
            case place_name = "place_name"
            case receive_address = "receive_address"
            case delivery_price = "delivery_price"
            case go_to_service_center_now = "go_to_service_center_now"
            case delegate_status = "delegate_status"
            case status = "status"
            case desc = "desc"
            case date = "date"
            case time = "time"
            case payment_type = "payment_type"
            case payment_type_ = "payment_type_"
            case delivery_type = "delivery_type"
            case payment_status = "payment_status"
            case images = "images"
            case created_at = "created_at"
        }
}
struct ShipmentImages : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }}
