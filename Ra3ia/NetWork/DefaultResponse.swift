//
//  DefaultResponse.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation

struct DefaultResponse: Codable, CodableInit {
    var key: String
    var code: Int
    var msg:String?
  
}
struct resendCodeModel : Codable, CodableInit {
    var key: String
    var code: Int
    var status :String?
  
}

struct forgetPasswordModel : Codable, CodableInit {
    var key: String
    var code: Int
    var data :String?
  
}
