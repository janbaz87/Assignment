//
//  QuestionTableViewCell.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

class QuestionTableViewCell: BaseTableViewCell {

    //MARK: Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: Properties
    private var viewModel : QuestionTableViewCellViewModelType!
    
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
        guard let viewModel = viewModel as? QuestionTableViewCellViewModelType else { return }
        self.viewModel = viewModel
    }
}
