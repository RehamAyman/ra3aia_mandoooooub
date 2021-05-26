//
//  HomeModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/04/2021.
//

import Foundation
import Foundation

// MARK: - AgreamentsModel
struct HomeModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: HomeData
}

// MARK: - DataClass
struct HomeData: Codable {
    let joinrequests: [Joinrequest]
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let image: String?
    let title, status, productStatus, address: String
    let desc, startingPrice, minBidPrice, started: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case id, image, title, status
        case productStatus = "status_"
        case address, desc
        case startingPrice = "starting_price"
        case minBidPrice = "min_bid_price"
        case started, date
    }
}

// MARK: - Joinrequest
struct Joinrequest: Codable {
    let id: Int
    let name: String
    let avatar: String
}
