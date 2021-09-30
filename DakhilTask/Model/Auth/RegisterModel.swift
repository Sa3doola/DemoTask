//
//  RegisterModel.swift
//  SecoundTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import Foundation

struct RegisterModel: Codable {
    let key: String?
    let data: RegisterData?
    let msg: String?
    let code: Int?
}

// MARK: - Data
struct RegisterData: Codable {
    let userPhone: String?

    enum CodingKeys: String, CodingKey {
        case userPhone = "user_phone"
    }
}
