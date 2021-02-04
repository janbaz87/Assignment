//
//  CompletionViewController.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 23/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

class CompletionViewController: UIViewController,StoryboardInitializable {
    static func storyboardName() -> String {
        //return the name of storyboard
        return "Main"
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    //MARK: Properties
    var viewModel : CompletionViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }

    func render() {
        navigationItem.hidesBackButton = true
        self.title = viewModel.outputs.title()
        messageLabel.text = viewModel.outputs.successMessage()
    }
}
