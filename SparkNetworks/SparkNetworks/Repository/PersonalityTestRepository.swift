//
//  PersonalityTestRepository.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 21/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

class PersonalityTestRepository: BaseRepository {

    func getPersonalityTestQuestions() -> PersonalityTest {
        return PersonalityTest.mocked
       // return personalityTestService.personalityTestQuestions()
    }
}
