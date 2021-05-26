//
//  ServerPaths.swift
//  SeaTrips
//
//  Created by Sara Mady on 10/27/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation

//delegate-home


enum ServerPaths: String {
    
    //MARK:- Authntcation APIS:-
    case intros
    
    case login
    case register
    case verifyPhone = "verify-phone"
    case resendCode = "resend-code"
    case forgotPassword = "forgot-password"
    case resetPassword = "reset-password"
    case delegateHome = "delegate-home"
    case ShipmentDetails = "delegate-single-order"
    
    
    case about
    case agreaments
    case logout
    case profile //profile
   
    case rate
    
    case social
    case contactUs = "contact-us"
    
    case wallet
    case UpdateProfile = "update-profile"
    case acceptOrder = "delegate-accept-order"
    case sendOffer = "make-delivery-offer"
    case orders = "delegate-orders"
    case bankAccounts = "delegate-bank-accounts"
    case addBankAccount = "delegate-add-bank-account"
    case FinAccount = "delegate-commissions"
    case rooms = "delegate-rooms"
    case changeOrderStatus = "delegate-change-order-status"
    case finishOrder = "delegate-finish-order"
    case withdrawal = "delegate-withdraw-order"
  

    
    
}
