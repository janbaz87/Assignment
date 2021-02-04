//
//  BaseRepository.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 21/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

class BaseRepository {
    init() {}
       
    public lazy var personalityTestService: PersonalityTestService = {
           return PersonalityTestService()
    }()
    
}


