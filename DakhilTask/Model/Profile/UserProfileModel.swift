//
//  UserProfileModel.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/30/21.
//

import Foundation

// MARK: - UserProfileModel
struct UserProfileModel: Codable {
    let key: String?
    let data: ProfileData?
    let msg: String?
    let code: Int?
}

// MARK: - DataClass
struct ProfileData: Codable {
    let userBaseInfo: UserBaseInfo?

    enum CodingKeys: String, CodingKey {
        case userBaseInfo = "user_base_info"
    }
}

