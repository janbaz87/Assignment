//
//  BaseCoordinator.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 18/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import UIKit

/// Base abstract coordinator generic over the return type of the `start` method.
class BaseCoordinator<ResultType> {
    
    /// Typealias which will allows to access a ResultType of the Coordainator by `CoordinatorName.CoordinationResult`.
    typealias CoordinationResult = ResultType
    
    /// Unique identifier.
    private let identifier = UUID()

    private weak var rootViewController : UIViewController?
    
    init(rootVC: UIViewController?) {
        rootViewController = rootVC
        
    }
    
    /// 1. Stores coordinator in a dictionary of child coordinators.
    /// 2. Calls method `start()` on that coordinator.
    /// - Parameter coordinator: Coordinator to start.
    func coordinate<T>(to coordinator: BaseCoordinator<T>) {
        coordinator.start()
    }
    
    /// Starts job of the coordinator.
    func start() {
        #if DEBUG
        fatalError("init(coder:) has not been implemented. Should be instantiated from code.")
        #endif
        
    }
}
extension BaseCoordinator {
    func showError(error: AppError) {
        if let controller = rootViewController{
            controller.showError(error: error)
        }else {
            UIViewController().showError(error: error)
        }
    }
}
