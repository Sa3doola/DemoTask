//
//  ContactUsInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Alamofire

class ContactUsInteractor {
    
    func getContactUs(completion: @escaping completion<ContanctUsModel>) {
        AF.request(APIRouter.setting(type: "contactUs")).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
