//
//  PersonalityTestViewModelTests.swift
//  SparkNetworksTests
//
//  Created by Janbaz Ali on 24/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkNetworks

class PersonalityTestViewModelTests: XCTestCase {
    var repository : PersonalityTestRepository!
    var sut : PersonalityTestViewModel!
    var mockData : PersonalityTest!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = PersonalityTestRepository()
        sut = PersonalityTestViewModel(coordinator: PersonalityTestCoordinator(window: UIWindow()))
        mockData =  PersonalityTest.mocked
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repository = nil
        sut = nil
    }

    func test_title_viewmodels() {

        let correctValues = "Personality test loading..."
        XCTAssertEqual(correctValues, sut.title())
    }
    
    func test_handle_api_data() {
        let correctValues = 1
        let result = sut.handleApiRespose(test: mockData)
        XCTAssertEqual(correctValues, result.count)
    }
    
    func test_next_question() {
        let correctValues = TestStatus.end
        _ = sut.handleApiRespose(test: mockData)
        sut.nextQuestion { (status) in
            XCTAssertEqual(correctValues, status)
        }
    }

    func number_of_rows() {
        let correctValues = 4
        _ = sut.handleApiRespose(test: mockData)
        let result = sut.numberOfRows()
        XCTAssertEqual(correctValues, result)
        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
