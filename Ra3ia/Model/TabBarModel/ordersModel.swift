//
//  ordersModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/7/21.
//

import Foundation
struct ordersModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : ordersData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }}
struct ordersData : Codable {
    let active_orders : [Active_orders]
    let finished_orders : [Finished_orders]

    enum CodingKeys: String, CodingKey {

        case active_orders = "active_orders"
        case finished_orders = "finished_orders"
    }}

struct Finished_orders : Codable {
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
    }}
struct Active_orders : Codable {
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
    }}

