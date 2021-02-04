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
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    
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
        
        if self.isSelected {
            if let icon = UIImage(named: "checked") {
                radioButton.setImage(icon, for: .normal)
                radioButton.tintColor = (.blue_white)
            }
        }else {
            if let icon = UIImage(named: "unchecked") {
                radioButton.setImage(icon, for: .normal)
                radioButton.tintColor = (.grey_grey)
            }
        }
        
        render()
    }
       
    func render() {
        answerLabel.text = viewModel.outputs.text()
    }
}
