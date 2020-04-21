//
//  PersonalityTestService.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 21/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

class PersonalityTestService {
    init() {
        
    }
    
    func personalityTestQuestions() -> PersonalityTest {
        return PersonalityTest.mocked
    }
}
