//
//  OrderDetails.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/19/21.
//

import Foundation

// MARK: - OrderDetails

struct OrderDetails: Codable {
    let key: String?
    let data: OrderData?
    let msg: String?
    let code: Int?
}

// MARK: - OrderData

struct OrderData: Codable {
    let id: Int?
    let price: Double?
    let services: [Service]?
}

// MARK: - Service

struct Service: Codable {
    let id, amount, serviceID: Int?
    let serviceImage: URL?
    let serviceName, serviceMeasurement: String?
    let serviceRate: Int?
    let servicePrice: Double?

    enum CodingKeys: String, CodingKey {
        case id, amount
        case serviceID = "service_id"
        case serviceImage = "service_image"
        case serviceName = "service_name"
        case serviceMeasurement = "service_measurement"
        case serviceRate = "service_rate"
        case servicePrice = "service_price"
    }
}

// MARK: - UpdateOrder

struct UpdateOrder: Codable {
    let key: String?
    let data: UpdateOrderData?
    let msg: String?
    let code: Int?
}

// MARK: - UpdateOrderData

struct UpdateOrderData: Codable {
    let orderPrice: Double?

    enum CodingKeys: String, CodingKey {
        case orderPrice = "order_price"
    }
}
