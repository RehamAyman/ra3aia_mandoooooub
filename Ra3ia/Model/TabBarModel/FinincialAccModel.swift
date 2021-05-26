//
//  BillsModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 5/10/21.
//

import Foundation
struct FinincialAccModel : Codable , CodableInit{
    let key : String?
    let code : Int?
    let data : FinAccountData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }
}
struct FinAccountData : Codable {
    let total_delivery : String
    let not_paid_commissions : String
    let payment_url : String
    let commissions : [Commissions]

    enum CodingKeys: String, CodingKey {

        case total_delivery = "total_delivery"
        case not_paid_commissions = "not_paid_commissions"
        case payment_url = "payment_url"
        case commissions = "commissions"
    }}


struct Commissions : Codable {
    let id : Int
    let order : Int
    let commission : String
    let total_price : String
    let single_payment_url : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case order = "order"
        case commission = "commission"
        case total_price = "total_price"
        case single_payment_url = "single_payment_url"
    }}
