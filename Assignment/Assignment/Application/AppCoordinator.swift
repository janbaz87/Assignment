//
//  AppCoordinator.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import UIKit
class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init(rootVC: nil)
    }
    
    override func start() {
        let personalityTestCoordinator = PersonalityTestCoordinator(window: self.window)
        coordinate(to: personalityTestCoordinator)
    }
}
