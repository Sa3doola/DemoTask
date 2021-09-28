//
//  FilterInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/28/21.
//

import Alamofire

class FilterInteractor {
    
    func getCities(completion: @escaping completion<FilterCitiesModel>) {
        AF.request(APIRouter.filterCities).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
