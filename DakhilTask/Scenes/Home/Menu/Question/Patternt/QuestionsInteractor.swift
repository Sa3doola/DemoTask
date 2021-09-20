//
//  QuestionsInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import Alamofire

class QuestionsInteractor {
    
    func getQuestions(completion: @escaping completion<QuestionModel>) {
        AF.request(APIRouter.setting(type: "fqs")).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
