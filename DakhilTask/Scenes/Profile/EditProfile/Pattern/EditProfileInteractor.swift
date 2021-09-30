//
//  EditProfileInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/30/21.
//

import Alamofire

class EditProfileInteractor {
    
    func getCities(completion: @escaping completion<ProviderDataModel>) {
        AF.request(APIRouter.getCities).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
