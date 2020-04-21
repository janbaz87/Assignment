//
//  PersonalityTest.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

enum TestStatus {
    case start
    case end
    case previous
    case next
}

enum Type : String, Codable {
    case single = "single_choice"
    case conditional = "single_choice_conditional"
    case numberRange = "number_range"
}

struct PersonalityTest: Codable {
    let categories: [String]
    let questions: [Question]
}

struct Question: Codable {
    let question: String
    let category: String
    let questionType: QuestionType
    
    enum CodingKeys: String, CodingKey {
        case question, category
        case questionType = "question_type"
    }
}


struct QuestionType: Codable {
    let type: Type
    let options: [String]
    let condition: Condition?
}

struct Condition: Codable {
    let predicate: Predicate
    let subQuestion: SubQuestion
    
    enum CodingKeys : String, CodingKey {
        case predicate
        case subQuestion = "if_positive"
    }
}

struct Predicate: Codable {
    let exactEquals : [String]
}

struct SubQuestion: Codable {
    let question: String
    let category: String
    let questionType: SubQuestionType
    
    enum CodingKeys: String, CodingKey {
        case question, category
        case questionType = "question_type"
    }
}

struct SubQuestionType: Codable {
    let type: Type
    let range: Range
}

struct Range: Codable {
    let from: Int
    let to: Int
}


extension PersonalityTest {
    static var mocked : PersonalityTest {
        return PersonalityTest.init(categories: ["A","B","C","D"],
                                    questions:
        [Question.init(question: "how are you", category: "A",
                       questionType: QuestionType.init(type: .single,
                                        options: ["good","very good","bad"],
                                        condition: nil)),
         Question.init(question: "where do you live", category: "B",
                       questionType: QuestionType.init(type: .single,
                                        options: ["good","very good","bad"],
                                        condition: nil)),
         Question.init(question: "Where are you from", category: "C",
                       questionType: QuestionType.init(type: .single,
                                        options: ["good","very good","bad"],
                                        condition: nil)),
         Question.init(question: "What's up girl", category: "D",
                       questionType: QuestionType.init(type: .single,
                                        options: ["good","very good","bad"],
                                        condition: nil))])
    }
}
