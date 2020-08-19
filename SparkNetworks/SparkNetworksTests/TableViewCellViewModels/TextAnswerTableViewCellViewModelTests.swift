//
//  TextAnswerTableViewCellViewModelTests.swift
//  SparkNetworksTests
//
//  Created by Janbaz Ali on 07/05/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkNetworks 

class  TextAnswerTableViewCellViewModelTests: XCTestCase {
    
    var sut : TextAnswerTableViewCellViewModelType!
    
    override func setUp() {
        
        sut = TextAnswerTableViewCellViewModel()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    /// this method is to text the placeholder text 
    func test_placeholder_text () {
        let acceptedAnswer = "Enter your answer here"
        let result = sut.outputs.getPlaceholder()
        
        XCTAssertEqual(acceptedAnswer, result)
    }
    
    /// this method will text the method for saving answer
    func test_save_answer() {
        let acceptedAnswer = "30 years"
         sut.inputs.saveAnswer(answer: acceptedAnswer)
        let result = sut.outputs.getAnswer()
        XCTAssertEqual(acceptedAnswer, result )
    }
}
