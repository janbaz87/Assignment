//
//  BaseUITableViewCell.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import UIKit

// MARK: Reusable view
protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: Configurable table view cell
protocol ConfigurableTableViewCell {
    func configure(with viewModel: Any)
    func setIndexPath(_ indexPath: IndexPath)
}

//MARk: Base tableview cell
class BaseTableViewCell: UITableViewCell, ReusableView, ConfigurableTableViewCell, DequeueInitializable {
    var indexPath: IndexPath!
    
    func configure(with viewModel: Any) {
         fatalError("Configure with viewModel must be implemented.")
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}
