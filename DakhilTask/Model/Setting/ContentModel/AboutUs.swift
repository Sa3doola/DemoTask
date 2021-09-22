//
//  AboutUs.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

// MARK: - AboutUsModel
struct AboutUsModel: Codable {
    let key: String?
    let data: AboutUsData?
    let msg: String?
    let code: Int?
}

// MARK: - AboutUsData
struct AboutUsData: Codable {
    let aboutUs: String?
}
