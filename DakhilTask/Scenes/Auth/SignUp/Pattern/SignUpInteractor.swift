//
//  SignUpInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

class SignUpInteractor {
    
    func signUp(userName: String, phone: String, cityId: Int, lat: Double, lng: Double,
                address: String, password: String, confirmPass: String, addressTypeID: String,
                completion: @escaping completion<RegisterModel>) {
        AF.request(APIRouter.register(
                    name: userName, phoneNumber: phone, city_Id: cityId, lat: lat, lon: lng,
                    address: address, password: password, password_confirmation: confirmPass, address_type_id: addressTypeID)).responseDecodable { (response) in
                        completion(response.result)
                    }
    }
    
    func getCities(completion: @escaping completion<ProviderDataModel>) {
        AF.request(APIRouter.getCities).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
