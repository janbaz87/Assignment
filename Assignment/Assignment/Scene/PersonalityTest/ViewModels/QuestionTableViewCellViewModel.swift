//
//  QuestionViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol QuestionTableViewCellViewModelInputs {
   
}
protocol QuestionTableViewCellViewModelOutputs {
    func text() -> String
    
}
protocol QuestionTableViewCellViewModelType {
    var inputs : QuestionTableViewCellViewModelInputs { get }
    var outputs : QuestionTableViewCellViewModelOutputs { get }
}

class QuestionTableViewCellViewModel: ReusableTableViewCellViewModelType, QuestionTableViewCellViewModelType {
    
    var inputs: QuestionTableViewCellViewModelInputs { return self }
    var outputs: QuestionTableViewCellViewModelOutputs { return self }
    
    //MARK: Properties
    var reusableIdentifier: String {return QuestionTableViewCell.reuseIdentifier }
    //MARK: Properties
    private let question: String
    
    
    //MARK: Init
    init(question: String) {
        self.question = question
    }
    
}

extension QuestionTableViewCellViewModel: QuestionTableViewCellViewModelOutputs {
   
    
    func text() -> String {
        return question
    }
}

extension QuestionTableViewCellViewModel: QuestionTableViewCellViewModelInputs {
    
}
