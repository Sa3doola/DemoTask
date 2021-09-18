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
    
    // MARK: - Home
    
    case homePage

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
        }
    }

    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
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
        case .homePage:
            return nil
        }
        return params
    }

    internal var method: HTTPMethod {
        switch self {
        case .login, .register, .activation:
            return .post
        case .getCities, .homePage:
            return .get
        }
    }
}
