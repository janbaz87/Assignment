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

class AnswerTableViewCellViewModel: ReusableTableViewCellViewModelType {
    
    var reusableIdentifier: String {return AnswerTableViewCell.reuseIdentifier }
    
    
}

