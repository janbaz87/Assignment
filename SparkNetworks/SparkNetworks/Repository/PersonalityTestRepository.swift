//
//  PersonalityTestRepository.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 21/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

class PersonalityTestRepository: BaseRepository {
    
    func getPersonalityTest(completion: @escaping(PersonalityTest?,AppError?) -> Void)  {
         personalityTestService.personalityTest { result in

            switch result{

            case .failure(let error):
                completion(nil,error)

            case .success(let test):
                completion(test, nil)
            }
        }
    }
    
    func mockData() -> PersonalityTest {
        return PersonalityTest.mocked
    }
}
