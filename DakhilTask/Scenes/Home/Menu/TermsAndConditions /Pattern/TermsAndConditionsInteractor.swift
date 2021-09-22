//
//  TermsAndConditionsInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Alamofire

class TermsAndConditionsInteractor {
    func getTermsAndConditions(completion: @escaping completion<TermsModel>) {
        AF.request(APIRouter.setting(type: "termsConditions")).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
