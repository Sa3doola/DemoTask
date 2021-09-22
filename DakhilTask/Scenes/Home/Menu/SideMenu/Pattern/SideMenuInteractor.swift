//
//  SideMenuInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Alamofire

class SideMenuInteractor {
    
    func logOut(completion: @escaping completion<LogOutModel>) {
        AF.request(APIRouter.logOut).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
