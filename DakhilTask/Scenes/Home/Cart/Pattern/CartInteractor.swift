//
//  CartInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

class CartInteractor {
    
    func cartDetails(uuid: String, completion: @escaping completion<CartDetails>) {
        AF.request(APIRouter.cartDetails(uuid: uuid)).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
