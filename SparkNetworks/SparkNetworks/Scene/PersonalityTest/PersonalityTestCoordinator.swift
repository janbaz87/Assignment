//
//  PersonalityTestCoordinator.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import UIKit
class PersonalityTestCoordinator: BaseCoordinator<Void> {
    private weak var window: UIWindow?
    private weak var rootViewController : UIViewController!
    private var navigationController: UINavigationController!
    
   init(window: UIWindow) {
       self.window = window
       super.init(rootVC: rootViewController)
   }
    
    override func start() {
        let viewController = PersonalityTestViewController.initFromStoryboard()
        let viewModel = PersonalityTestViewModel(coordinator: self)
        viewController.viewModel = viewModel
        
        rootViewController = viewController
        navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

extension PersonalityTestCoordinator {
    func compeltionScene() {
        DispatchQueue.main.async {
            let viewController = CompletionViewController.initFromStoryboard()
            let viewModel = CompletionViewModel(coordinator: self)
            viewController.viewModel = viewModel
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
}
