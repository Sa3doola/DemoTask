//
//  UserRequest.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

enum APIRouter: URLRequestBuilder {
    
    // Authentication
    case login(phone:String , password : String, userType: String, deviceID: String, deviceType: String, uuid: String)
    case register(name: String, phoneNumber: String, city_Id: Int, lat: Double, lon: Double, address: String, password: String, password_confirmation: String, address_type_id: String)
    case getCities
    case activation(phone: String, code: String, deviceID: String, deviceType: String, uuid: String)
    case logOut
    
    // Home
    case homePage
    
    // Categories
    case categories(name: String, page: Int)
    case catgegoriesProvider(id: Int, lat: Double, lng: Double, page: Int)
    case filterCategories(id: Int, lat: Double, lng: Double, rate: String, cityId: Int)
    case filterCities
    
    // Cart
    case addToCart(uuid: String, lat: Double, lng: Double, address: String, providerID: Int, serviceId: Int, amount: Int)
    case cartDetails(uuid: String)
    case orderDetails(orderID: Int)
    case updateOrderAmount(orderServiceId: Int, amount: Int)
    
    // Setting
    case setting(type: String)
    
    // profile
    case profile
    
    case updateProfile(name: String, phone: String, cityId: Int, uuid: String)
    
    internal var path: String {
        switch self {
        // Auth
        case .login:
            return "login"
        case .register:
            return "client_sign_up"
        case .getCities:
            return "providerRegistrationData"
        case .activation:
            return "user_activation"
        case .logOut:
            return "logOut"
            
        // Home
        case .homePage:
            return "clientHomePage"
            
        // Categories
        case .categories:
            return "categories"
        case .catgegoriesProvider:
            return "categoryProviders"
        case .filterCategories:
            return "categoryProviders"
        case .filterCities:
            return "cities"
        // Cart
        case .addToCart:
            return "addToCart"
        case .cartDetails:
            return "cartDetails"
        case .orderDetails:
            return "orderDetails"
        case .updateOrderAmount:
            return "updateAmount"
            
        // Settings
        case .setting:
            return "sidePages"
        
        case .profile:
            return "clientProfile"
        case .updateProfile:
            return "updateClient"
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
            
        // Categories
        case .categories(let name, let page):
            params["name"] = name
            params["page"] = page
        case .catgegoriesProvider(let id, let lat, let lng, let page):
            params["category_id"] = id
            params["lat"] = lat
            params["lng"] = lng
            params["page"] = page
        case .filterCategories(let id, let lat, let lng, let rate, let cityId):
            params["category_id"] = id
            params["lat"] = lat
            params["lng"] = lng
            params["rate"] = rate
            params["city_id"] = cityId
        case .filterCities:
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
            
        // Profile
        case .profile:
            return nil
            
        case .updateProfile(let name, let phone, let citID, let uuid):
            params["name"] = name
            params["phone"] = phone
            params["city_id"] = citID
            params["uuid"] = uuid
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
        // Categories
        case .categories, .catgegoriesProvider, .filterCities, .filterCategories:
            return .get
        // Cart
        case .addToCart, .cartDetails, .orderDetails, .updateOrderAmount:
            return .post
        // Setting
        case .setting:
            return .get
        // Profile
        case .profile:
            return .get
        case .updateProfile:
            return .post
        }
    }
}
