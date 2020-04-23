//
//  AnswerTableViewCellViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
protocol AnswerTableViewCellViewModelInputs {
     func setSelectedIndex(index: Int)
}
protocol AnswerTableViewCellViewModelOutputs {
    func text() -> String
    func getSelectedIndex() -> Int
}
protocol AnswerTableViewCellViewModelType {
    var inputs : AnswerTableViewCellViewModelInputs { get }
    var outputs : AnswerTableViewCellViewModelOutputs { get }
}

class AnswerTableViewCellViewModel<T>: ReusableTableViewCellViewModelType, AnswerTableViewCellViewModelType {
    var inputs: AnswerTableViewCellViewModelInputs { return self }
    
    var outputs: AnswerTableViewCellViewModelOutputs { return self }
    
    
    var reusableIdentifier: String {return AnswerTableViewCell.reuseIdentifier }
    
    //MARK: Properties
    let asnwer: T
    private var selectedIndex: Int = -1
    
    //MARK: Init
    init(answer: T) {
        self.asnwer = answer
    }
    
}

extension AnswerTableViewCellViewModel: AnswerTableViewCellViewModelOutputs {
    func getSelectedIndex() -> Int {
           return selectedIndex
       }
    func text() -> String {
        
        return "\(self.asnwer)"
    }
}

extension AnswerTableViewCellViewModel: AnswerTableViewCellViewModelInputs {
    func setSelectedIndex(index: Int) {
        selectedIndex = index
    }
}

