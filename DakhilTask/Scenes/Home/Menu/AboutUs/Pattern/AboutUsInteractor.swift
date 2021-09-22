//
//  AboutUsInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Alamofire

class AboutUsInteractor {
    func getAboutUs(completion: @escaping completion<AboutUsModel>) {
        AF.request(APIRouter.setting(type: "aboutUs")).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
