//
//  ProductInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Alamofire

class ProductInteractor {
    
    func addToCart(uuid: String, lat: Double, lng: Double, address: String, providerId: Int,
                   serviceId: Int, amount: Int, completion: @escaping completion<AddToCart>) {
        AF.request(APIRouter.addToCart(uuid: uuid, lat: lat, lng: lng, address: address,
                                       providerID: providerId, serviceId: serviceId, amount: amount)).responseDecodable { (response) in
                                        completion(response.result)
                                       }
    }
}
