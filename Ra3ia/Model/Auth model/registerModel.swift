//
//  registerModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/24/21.
//

import Foundation
// MARK: - mew mandob reg


struct RegisterModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let msg: String
    let data: registerData
}

// MARK: - DataClass
struct registerData: Codable {
    let token, status: String
}
