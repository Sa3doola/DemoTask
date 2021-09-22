//
//  ContactUs.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

// MARK: - ContanctUsModel
struct ContanctUsModel: Codable {
    let key: String?
    let data: ContactData?
    let msg: String?
    let code: Int?
}

// MARK: - ContactData
struct ContactData: Codable {
    let contactUs: ContactUs?
}

// MARK: - ContactUs
struct ContactUs: Codable {
    let mobile, whatsApp: String?
    let linkedIn, twitter, facebook, instagram: URL?

    enum CodingKeys: String, CodingKey {
        case mobile
        case whatsApp = "whats_app"
        case linkedIn = "linked_in"
        case twitter, facebook, instagram
    }
}
