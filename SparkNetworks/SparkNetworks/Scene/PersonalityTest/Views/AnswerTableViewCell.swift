//
//  AnswerTableViewCell.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

class AnswerTableViewCell: BaseTableViewCell {
    //MARK: Properties
    private var viewModel: AnswerTableViewCellViewModelType!
    
    //MARK: View cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Configuration
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? AnswerTableViewCellViewModelType else { return }
        self.viewModel = viewModel
    }
    
}
