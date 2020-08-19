//
//  TextAnswerTableViewCell.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 07/05/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

class TextAnswerTableViewCell: BaseTableViewCell {

    @IBOutlet weak var answetTextField: UITextField!
    
    var viewModel: TextAnswerTableViewCellViewModelType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configure(with viewModel: Any) {
        guard let viewmodel = viewModel as? TextAnswerTableViewCellViewModelType else {
            return
        }
        self.answetTextField.delegate = self
        self.viewModel = viewmodel
        render()
    }
    
    func render() {
        answetTextField.placeholder = viewModel.outputs.getPlaceholder()
    }
}

extension TextAnswerTableViewCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.inputs.saveAnswer(answer: textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
