//
//  HomeModel.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/15/21.
//

import Foundation

// MARK: - HomePageModel
struct HomePageModel: Codable {
    let key: String?
    let data: DataHomeClass?
    let msg: String?
    let code: Int?
}

// MARK: - DataHomeClass
struct DataHomeClass: Codable {
    let slides: [Slide]?
    let categories: [HomeCategory]?
    let randomCategory: HomeCategory?
    let serviceWithOffer: [ProductModel]?
    
    enum CodingKeys: String, CodingKey {
        case slides, categories
        case randomCategory = "random_category"
        case serviceWithOffer = "service_with_offer"
    }
}

// MARK: - HomeCategory
struct HomeCategory: Codable {
    let id: Int?
    let image: URL?
    let name, categoryDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id, image, name
        case categoryDescription = "description"
    }
}

// MARK: - ServiceWithOffer
struct ProductModel: Codable {
    let id: Int?
    let status: String?
    let image: URL?
    let name, nameAr, nameEn: String?
    let categoryID: Int?
    let categoryName, measurement: String?
    let measurementID, avgRate, discountPercentage: Double?
    let discountStatus, serviceWithOfferDescription, descriptionAr, descriptionEn: String?
    let price: Double?
    let originalPrice: Double?
    let priceAfterDiscount: Double?
    let providerID: Int?
    let providerName, storeName: String?
    let distance: Double?
    let isFavourit: String?
    
    enum CodingKeys: String, CodingKey {
        case id, status, image, name
        case nameAr = "name_ar"
        case nameEn = "name_en"
        case categoryID = "category_id"
        case categoryName = "category_name"
        case measurement
        case measurementID = "measurement_id"
        case avgRate = "avg_rate"
        case discountPercentage = "discount_percentage"
        case discountStatus = "discount_status"
        case serviceWithOfferDescription = "description"
        case descriptionAr = "description_ar"
        case descriptionEn = "description_en"
        case price
        case originalPrice = "original_price"
        case priceAfterDiscount = "price_after_discount"
        case providerID = "provider_id"
        case providerName = "provider_name"
        case storeName = "store_name"
        case distance
        case isFavourit = "is_favourit"
    }
}

// MARK: - Slide

struct Slide: Codable {
    let id: Int?
    let image: URL?
}
