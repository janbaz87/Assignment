//
//  PersonalityTestViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol PersonalityTestViewModelInput {
    func rowSelected(at indexPath: IndexPath)
}

protocol PersonalityTestViewModelOutput {
    func title()->String
    func numberOfRows()->Int
    func viewModel(for indexPath: IndexPath)
}

protocol PersonalityTestViewModelType {
    var inputs: PersonalityTestViewModelInput { get }
    var outputs: PersonalityTestViewModelOutput { get }
}

class PersonalityTestViewModel : PersonalityTestViewModelType  {
    
    var inputs: PersonalityTestViewModelInput { return self }
    var outputs: PersonalityTestViewModelOutput { return self }
    
    //MARK: Properties
    var viewModels = [Int]()
    
    //MARK: Init
    init() {
        
    }
}

//MARk: PersonalityTestViewModelOutputs
extension PersonalityTestViewModel:PersonalityTestViewModelOutput {
    
    func rowSelected(at indexPath: IndexPath) {
        
    }

}

//MARk: PersonalityTestViewModelInputs
extension PersonalityTestViewModel:PersonalityTestViewModelInput {
    
    func title() -> String {
        return ""
    }
    
    func numberOfRows() -> Int {
        return 10
    }
    
    func viewModel(for indexPath: IndexPath) {
        
    }

}