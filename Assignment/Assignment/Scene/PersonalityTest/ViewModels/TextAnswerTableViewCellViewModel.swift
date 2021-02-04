//
//  TextAnswerTableViewCellViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 07/05/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
protocol TextAnswerTableViewCellViewModelInputs {
    func saveAnswer(answer: String?)
}

protocol TextAnswerTableViewCellViewModelOutputs {
    func getPlaceholder() -> String
    func getAnswer() ->  String
}

protocol TextAnswerTableViewCellViewModelType {
    var inputs : TextAnswerTableViewCellViewModelInputs { get }
    var outputs: TextAnswerTableViewCellViewModelOutputs { get }
}

class TextAnswerTableViewCellViewModel: ReusableTableViewCellViewModelType,TextAnswerTableViewCellViewModelType  {
    //MARK: Properties
    var inputs: TextAnswerTableViewCellViewModelInputs { return self }
    var outputs: TextAnswerTableViewCellViewModelOutputs { return self }
    var answer: String?
    var reusableIdentifier: String { return TextAnswerTableViewCell.reuseIdentifier }
    
    //MARK: Init
    init() {
        self.answer = ""
    }
}


extension TextAnswerTableViewCellViewModel: TextAnswerTableViewCellViewModelInputs {
    func saveAnswer(answer: String?) {
        guard let answer = answer else { return }
        self.answer = answer
    }
}

extension TextAnswerTableViewCellViewModel: TextAnswerTableViewCellViewModelOutputs {
    /// returns the placeholder text for text field
    func getPlaceholder() -> String {
        return "Enter your answer here"
    }
    
    func getAnswer() ->  String {
        guard let answer = answer else { return "" }
        return answer
    }
}
