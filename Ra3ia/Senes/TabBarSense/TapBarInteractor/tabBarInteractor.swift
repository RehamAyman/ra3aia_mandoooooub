import Foundation
import Alamofire

enum TabBarinteractor: URLRequestBuilder {
    
   //1
  
    case rate
    case wallet
    case social
    case about
    case contactUs(type:String,subject:String,content:String)
    case logout(device_id:String)
    case agreaments
    case profile
    case delegateHome
    case UpdateProfile(fname:String,lname:String,email:String,phone:String )
    case ShipmentDetails ( id : Int)
    case acceptOrder( id : Int)
    case sendOffer (id : String , privatePrice : String , commonPrice : String , date : String , time : String , notes : String)
    case orders
    case bankAccounts
    case addBankAccount(bankName : String , accNumber : String , ibanNumber : String )
    
    case FinAccount
    case rooms
    case changeOrderStatus ( id : String , status : String)
    case finishOrder ( id : String)
    case withdrawal ( id : String , reason : String)
    case notifications
    case delegateSingleRoom(id:Int)
    case deleteBank( id : Int)
    case updatePassword( current_password : String , password : String )
    

    
  
    
    // MARK: - Path
    // 2
    internal var path: ServerPaths {
        
        switch self {
        
      
        case .rate:
            return .rate
        case .social:
            return .social
        case .about:
            return .about
        case .contactUs:
            return .contactUs
        case .logout:
            return .logout
        case .agreaments:
            return .agreaments
        case .wallet:
        return .wallet
        case .profile:
        return .profile
        case .delegateHome:
        return .delegateHome
        case .UpdateProfile:
        return .UpdateProfile
        case .ShipmentDetails:
            return .ShipmentDetails
        case . acceptOrder:
        return .acceptOrder
        case .sendOffer:
            return .sendOffer
        case .orders:
            return .orders
        case .bankAccounts:
            return .bankAccounts
        case .addBankAccount:
            return .addBankAccount
        case .FinAccount:
            return .FinAccount
        case .rooms:
        return .rooms
        case .changeOrderStatus:
            return .changeOrderStatus
        case .finishOrder:
            return .finishOrder
        case .withdrawal:
            return .withdrawal
        case .notifications:
            return .notifications
        case .delegateSingleRoom:
            return .delegateSingleRoom
        case .deleteBank:
            return .deleteBank
        case .updatePassword:
            return .updatePassword
            
            
            
       
        
        }}
    
    // MARK: - Parameters
  
    internal var parameters: Parameters? {
        var params = Parameters()
        
        switch self {
        
        // 3

        case .rate,.social,.about , .agreaments , .wallet , .profile , .delegateHome , .ShipmentDetails , .orders, .bankAccounts , .FinAccount , .rooms , .notifications , .delegateSingleRoom :
            break
          
        case .UpdateProfile(fname: let fname , lname: let lname, email: let email, phone: let phone):
            params["fname"] = fname
            params["lname"] = lname
            params["email"] = email
            params["phone"] = phone
       
            
        case .contactUs(type: let type, subject: let subject, content: let content):
            params["type"] = type
            params["subject"] = subject
            params["content"] = content
        
        case .logout(device_id: let device_id):
            params["device_id"] = device_id
       
        
            
        case .acceptOrder(id: let  id ):
            params["id"] = id
            
        case.sendOffer(id: let id , privatePrice: let privatePrice, commonPrice: let commonPrice , date: let date, time: let time , notes : let notes):
        params["id"] = id
        params["private_transportation_price"] = privatePrice
        params["common_transportation_price"] = commonPrice
        params["date"] = date
        params["time"] = time
        params["notes"] = notes
            
            
            
        case .addBankAccount(bankName: let bankName, accNumber: let accNumber, ibanNumber: let ibanNumber):
        params["bank_name"] = bankName
        params["acc_number"] = accNumber
        params["iban_number"] = ibanNumber
            
        case .changeOrderStatus(id: let id , status: let status):
            params["id"] = id
            params["status"] = status
            
        case.finishOrder(id: let id ):
        params["id"] = id
            
        case .withdrawal(id: let id , reason: let reason):
            params["id"] = id
            params["reason"] = reason
            
        case .deleteBank(id: let id ):
        params["id"] = id
        case .updatePassword(current_password: let current_password , password: let password ):
            params["current_password"] = current_password
            params["password"] = password
            
        
          
            
        }
     
        
        
        print("☠️\(params)")
        return params
    }
    
    
    internal var insideUrlParam: [String]?{
        switch self {
        case .ShipmentDetails(id: let id ):
            return ["\(id)"]
        case .delegateSingleRoom(id:let id):
            return ["\(id)"]
      
       
        
        
        default:
            return nil
        }
    }
    
    internal var headers: HTTPHeaders{
        var header = HTTPHeaders()
        switch self {
        
        default:
            if let token = KeyChain.userToken {
                header["Authorization"] = "Bearer \(token)"
            }
            header["lang"] = AppLanguage.getLang()
            
        }
        
        return header
    }
    
    var fcmTokenDevice: String {
        return  "token"
    }
    
    // MARK: - Method
    // 4
    internal var method: HTTPMethod {
        switch self {
        case .rate,.social,.about,.agreaments, .wallet , .profile , .delegateHome , .ShipmentDetails, .orders , .bankAccounts , .FinAccount , .rooms , .notifications , .delegateSingleRoom :
            return .get
        default:
            return .post
        }
    }
    
    /// 5
    // MARK: - Encoding
    
    internal var encoding: ParameterEncoding {
        switch self {
        case .about,.agreaments,.social , .rate , .wallet , .profile , .delegateHome , .ShipmentDetails , .acceptOrder , .orders , .bankAccounts , .FinAccount , .rooms , .notifications , .delegateSingleRoom:
            return URLEncoding.default
            
            
        default:
            return JSONEncoding.default
        }
    }
}
