//
//  agrementsModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/27/21.
//

import Foundation
// MARK: - AgreamentsModel
struct AgreamentsModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: agreamentsData
}

// MARK: - DataClass
struct agreamentsData: Codable {
    let agreaments: String
}
