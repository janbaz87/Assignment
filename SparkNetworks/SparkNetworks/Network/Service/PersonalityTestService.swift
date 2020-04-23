//
//  PersonalityTestService.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 21/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

class PersonalityTestService {
    private let apiConvertible:ApiService = APIClient()
    
    init() {
        
    }
    func personalityTest(completion: @escaping(Result<PersonalityTest?,AppError>) -> Void) {
    
        let router = Router.getTest
        apiConvertible.performRequest(router: router) { (result:Result<PersonalityTest, AppError>) in
            
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
