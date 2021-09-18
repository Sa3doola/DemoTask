//
//  LoginInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

class LoginInteractor {
    
    func login(phone: String, password: String, userType: String, deviceId: String, deviceType: String, uuid: String,
               completion: @escaping completion<LoginModel>) {
        AF.request(APIRouter.login(
                    phone: phone, password: password, userType: userType, deviceID: deviceId,
                    deviceType: deviceType, uuid: uuid)).responseDecodable { (response) in
                        completion(response.result)
                    }
    }
}
