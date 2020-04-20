//
//  QuestionViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol QuestionTableViewCellViewModelType {
    
}

class QuestionTableViewCellViewModel: ReusableTableViewCellViewModelType, QuestionTableViewCellViewModelType {
    
    var reusableIdentifier: String {return QuestionTableViewCell.reuseIdentifier }
    
    
}
