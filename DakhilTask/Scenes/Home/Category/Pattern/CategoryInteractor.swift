//
//  CategoryInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

class CategoryInteractor {
    
    func getProviderCategories(page: Int, id: Int, lat: Double, lng: Double, completion: @escaping completion<ProviderCategoriesModel>) {
        AF.request(APIRouter.catgegoriesProvider(id: id, lat: lat, lng: lng, page: page)).responseDecodable { (response) in
            completion(response.result)
        }
    }
    
    func filterCatagories(id: Int, lat: Double, lng: Double, cityID: Int, rate: String, completion: @escaping completion<ProviderCategoriesModel>) {
        AF.request(APIRouter.filterCategories(id: id, lat: lat, lng: lng, rate: rate, cityId: cityID)).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
