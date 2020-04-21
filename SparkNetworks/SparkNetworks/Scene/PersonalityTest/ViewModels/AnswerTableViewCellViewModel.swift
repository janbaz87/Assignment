//
//  AnswerTableViewCellViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol AnswerTableViewCellViewModelType {
    
}

class AnswerTableViewCellViewModel<T>: ReusableTableViewCellViewModelType {
    
    var reusableIdentifier: String {return AnswerTableViewCell.reuseIdentifier }
    
    //MARK: Properties
    let asnwer: T
    
    //MARK: Init
    init(answer: T) {
        self.asnwer = answer
    }
    
}

