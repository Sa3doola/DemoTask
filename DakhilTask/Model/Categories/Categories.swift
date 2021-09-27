//
//  Categories.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import Foundation

// MARK: - Categories
struct AllCategoriesModel: Codable {
    let key: String?
    let data: AllCategoriesData?
    let msg: String?
    let code: Int?
}

// MARK: - AllCategoriesData
struct AllCategoriesData: Codable {
    let categoires: [HomeCategory]?
    let paginate: Paginate?
}

// MARK: - ProviderCategories
struct ProviderCategoriesModel: Codable {
    let key: String?
    let data: ProviderCategoriesData?
    let msg: String?
    let code: Int?
}

// MARK: - ProviderCategoriesData
struct ProviderCategoriesData: Codable {
    let providers: [Provider]?
    let paginate: Paginate?
}

// MARK: - Provider
struct Provider: Codable {
    let id: Int?
    let image: URL?
    let name, address: String?
    let distance: Double?
    let avgRate: Double?

    enum CodingKeys: String, CodingKey {
        case id, image, name, address, distance
        case avgRate = "avg_rate"
    }
}
