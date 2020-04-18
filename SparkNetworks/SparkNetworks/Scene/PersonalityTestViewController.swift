//
//  PersonalityTestViewController.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 18/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

class PersonalityTestViewController: UIViewController,StoryboardInitializable {
    static func storyboardName() -> String {
        return "Main"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Yellow"
    }


}

