//
//  UserRequest.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

enum APIRouter: URLRequestBuilder {
    // MARK: - Authentication
    
    case login(phone:String , password : String, userType: String, deviceID: String, deviceType: String, uuid: String)
    case register(name: String, phoneNumber: String, city_Id: Int, lat: Double, lon: Double, address: String, password: String, password_confirmation: String, address_type_id: String)
    case getCities
    case activation(phone: String, code: String, deviceID: String, deviceType: String, uuid: String)
    case logOut
    
    // MARK: - Home
    
    case homePage
    
    // MARK: - Cart
    
    case addToCart(uuid: String, lat: Double, lng: Double, address: String, providerID: Int, serviceId: Int, amount: Int)
    case cartDetails(uuid: String)
    case orderDetails(orderID: Int)
    case updateOrderAmount(orderServiceId: Int, amount: Int)
    
    // MARK: - Setting
    
    case setting(type: String)
    
    internal var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "client_sign_up"
        case .getCities:
            return "providerRegistrationData"
        case .activation:
            return "user_activation"
        case .homePage:
            return "clientHomePage"
        case .addToCart:
            return "addToCart"
        case .cartDetails:
            return "cartDetails"
        case .orderDetails:
            return "orderDetails"
        case .updateOrderAmount:
            return "updateAmount"
        case .setting:
            return "sidePages"
        case .logOut:
            return "logOut"
        }
    }
    
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
        
        // Auth
        case .login(let phone,let password,let userType,let deviceID,let deviceType,let uuid):
            params["phone"] = phone
            params["password"] = password
            params["user_type"] = userType
            params["device_id"] = deviceID
            params["device_type"] = deviceType
            params["uuid"] = uuid
        case .register(let name,let phone,let cityId, let lat,let lan,let address,let password,let passwordConfirm,let addressTypeID):
            params["name"] = name
            params["phone"] = phone
            params["city_id"] = cityId
            params["lat"] = lat
            params["lng"] = lan
            params["address"] = address
            params["password"] = password
            params["password_confirmation"] = passwordConfirm
            params["address_type_id"] = addressTypeID
        case .getCities:
            return nil
        case .activation(let phone, let code, let deviceId, let deviceType, let uuid):
            params["phone"] = phone
            params["active_code"] = code
            params["device_id"] = deviceId
            params["device_type"] = deviceType
            params["uuid"] = uuid
        case .logOut:
            return nil
        // Home
        
        case .homePage:
            return nil
            
        // Cart
        case .addToCart(let uuid, let lat, let lng, let address,
                        let providerID, let serviceId, let amount):
            params["uuid"] = uuid
            params["lat"] = lat
            params["lng"] = lng
            params["address"] = address
            params["provider_id"] = providerID
            params["service_id"] = serviceId
            params["amount"] = amount
        case .cartDetails(let uuid):
            params["uuid"] = uuid
        case .orderDetails(let orderID):
            params["order_id"] = orderID
        case .updateOrderAmount(let orderServiceId, let amount):
            params["order_service_id"] = orderServiceId
            params["amount"] = amount
            
        // Setting
        case .setting(let type):
            params["type"] = type
            
        }
        return params
    }
    
    
    
    internal var method: HTTPMethod {
        switch self {
        // Auth
        case .login, .register, .activation, .logOut:
            return .post
        // Home
        case .getCities, .homePage:
            return .get
        // Cart
        case .addToCart, .cartDetails, .orderDetails, .updateOrderAmount:
            return .post
        // Setting
        case .setting:
            return .get
        }
    }
}
