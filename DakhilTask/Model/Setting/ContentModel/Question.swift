//
//  Question.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import Foundation

// MARK: - QuestionModel
struct QuestionModel: Codable {
    let key: String?
    let data: QuestionData?
    let msg: String?
    let code: Int?
}

// MARK: - QuestionData
struct QuestionData: Codable {
    let fqs: [Fq]?
}

// MARK: - Fq
struct Fq: Codable {
    let question, answer: String?
}
