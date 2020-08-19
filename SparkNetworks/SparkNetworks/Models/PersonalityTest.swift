//
//  PersonalityTest.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation



enum Type : String, Decodable {
    case single = "single_choice"
    case conditional = "single_choice_conditional"
    case numberRange = "number_range"
    case text = "text_answer"
}

struct PersonalityTest: Decodable {
    let categories: [String]
    var questions: [Question]
}

class Question: Decodable {
    var question: String
    var category: String
    var questionType: QuestionType
    
    enum CodingKeys: String, CodingKey {
        case question, category
        case questionType = "question_type"
    }
    
    init(question: String, category: String, questionType: QuestionType ) {
        self.question = question
        self.category = category
        self.questionType = questionType
    }
}

struct QuestionType: Decodable {
    let type: Type
    let options: [String]?
    let range: Range?
    let condition: Condition?
}

struct Condition: Decodable {
    let predicate: Predicate
    let subQuestion: Question
    
    enum CodingKeys : String, CodingKey {
        case predicate
        case subQuestion = "if_positive"
    }
}

struct Predicate: Decodable {
    let exactEquals : [String]
}

struct Range: Decodable {
    let from: Int
    let to: Int
}



//MARK: MOCK Data
extension PersonalityTest {
    static var mocked : PersonalityTest {
        /// we can return mock data from here
        return PersonalityTest.init(categories: ["hard_facr","passion"], questions: [Question.mockedText])
         
    }
}

extension Question {
    
    static var mockedConditional : Question {
        return Question(question: "How important is you age to you?", category: "hard_facr", questionType: QuestionType.mockedSingleChoiceConditional)
    }
    
    static var mockedRange : Question {
        return Question.init(question: "What is you age?", category: "hard_fact", questionType: QuestionType.mockedRange)
    }
    
    static var mockedText : Question {
         return Question.init(question: "What is you age?", category: "hard_fact", questionType: QuestionType.mockedText)
    }
}

extension QuestionType {
    static var mockedSingleChoiceConditional : QuestionType {
        return QuestionType.init(type: .conditional, options: ["not important","important","very important"], range: nil, condition: Condition.mocked)
    }
    
    static var mockedRange : QuestionType {
        return QuestionType.init(type: .numberRange, options: nil , range: Range.mocked, condition: nil)
    }
    
    static var mockedText : QuestionType {
        return QuestionType.init(type: .text, options: nil , range: Range.mocked, condition: nil)
    }
}

extension Range {
    static var mocked : Range {
        return Range.init(from: 10, to: 15)
    }
}

extension Condition {
    static var mocked : Condition {
        return Condition(predicate: Predicate.mocked, subQuestion: Question.mockedRange )
    }
}

extension Predicate {
    static var mocked: Predicate {
        return Predicate.init(exactEquals: ["","very important"])
    }
}
