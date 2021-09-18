//
//  MainHomeInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

class MainHomeInteractor {
    
    func getHomePage(completion: @escaping completion<HomePageModel>) {
        AF.request(APIRouter.homePage).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
