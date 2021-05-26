//
//  walletModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//

import Foundation
struct walletModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : WalletData
    
    
    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }

}


struct WalletData : Codable {
    let wallet : String
    let charge_url : String

    enum CodingKeys: String, CodingKey {

        case wallet = "wallet"
        case charge_url = "charge_url"
    }

  
}
