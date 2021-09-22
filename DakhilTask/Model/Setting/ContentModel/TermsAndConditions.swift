//
//  TermsAndConditions.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

// MARK: - TermsModel
struct TermsModel: Codable {
    let key: String?
    let data: TermsData?
    let msg: String?
    let code: Int?
}

// MARK: - TermsData
struct TermsData: Codable {
    let termsConditions: String?
}
