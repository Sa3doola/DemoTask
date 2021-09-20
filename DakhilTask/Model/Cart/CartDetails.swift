//
//  CartDetails.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/19/21.
//

import Foundation

// MARK: - AddToCart

struct AddToCart: Codable {
    let key, msg: String?
    let code: Int?
}

// MARK: - CartDetails

struct CartDetails: Codable {
    let key: String?
    let data: [CartData]?
    let msg: String?
    let code: Int?
}

// MARK: - CartData

struct CartData: Codable {
    let id: Int?
    let distance: Double?
    let address: String?
    let providerID: Int?
    let providerImage: URL?
    let providerName: String?
    let providerRate: Double?
    let categoryName: String?

    enum CodingKeys: String, CodingKey {
        case id, distance, address
        case providerID = "provider_id"
        case providerImage = "provider_image"
        case providerName = "provider_name"
        case providerRate = "provider_rate"
        case categoryName = "category_name"
    }
}
