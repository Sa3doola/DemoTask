//
//  AllCategoriesInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import Alamofire

class AllCategoriesInteractor {
    
    func getAllCategories(name: String, page: Int, completion: @escaping completion<AllCategoriesModel>) {
        AF.request(APIRouter.categories(name: name, page: page)).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
