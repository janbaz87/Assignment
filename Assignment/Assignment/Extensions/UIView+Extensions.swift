//
//  UIView+Extensions.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 21/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(with radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
