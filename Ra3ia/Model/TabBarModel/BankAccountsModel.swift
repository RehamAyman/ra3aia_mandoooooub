//
//  BankAccountsModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/9/21.
//

import Foundation
struct BankModel : Codable , CodableInit{
    let key : String
    let code : Int
    let data : [BankData]

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }
}


struct BankData : Codable {
    let id : Int
    let bank_name : String
    let acc_number : String
    let iban_number : String
    let bank_image : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case bank_name = "bank_name"
        case acc_number = "acc_number"
        case iban_number = "iban_number"
        case bank_image = "bank_image"
    }
}
