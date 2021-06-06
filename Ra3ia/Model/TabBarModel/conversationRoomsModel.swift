//
//  conversationRoomsModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/10/21.
//

import Foundation
struct ConversationRoomsModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : roomData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }}

struct roomData : Codable {
    let rooms : [Rooms]

    enum CodingKeys: String, CodingKey {

        case rooms = "rooms"
    }}
struct Rooms : Codable {
    let id : Int
    let sender_name : String
    let sender_avatar : String
    let last_message_created_at : String
    let last_message_content : String
    let last_message_id : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case sender_name = "sender_name"
        case sender_avatar = "sender_avatar"
        case last_message_created_at = "last_message_created_at"
        case last_message_content = "last_message_content"
        case last_message_id = "last_message_id"
    }}
