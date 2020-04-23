//
//  CompletionViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 23/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol CompletionViewModelInputs {
    
}
protocol CompletionViewModelOutputs {
    func title()-> String
    func successMessage()-> String
}
protocol CompletionViewModelType {
    var inputs: CompletionViewModelInputs { get }
    var outputs: CompletionViewModelOutputs { get }
}

class CompletionViewModel: CompletionViewModelType {
    
    var inputs: CompletionViewModelInputs { return self }
    var outputs: CompletionViewModelOutputs { return self }
    
    //MARK: Properties
    private var coordinator: PersonalityTestCoordinator
    
    
    //MARK: Init
    init(coordinator: PersonalityTestCoordinator) {
        self.coordinator = coordinator
    }
    
}
extension CompletionViewModel: CompletionViewModelOutputs {
    func title() -> String {
        return "Test completed"
    }
    
    func successMessage() -> String {
        return "Thank you for taking the test!"
    }
}

extension CompletionViewModel: CompletionViewModelInputs {
   
    
}
