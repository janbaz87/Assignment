//
//  UIColor+Extensions.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 18/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

public enum AppColorType {
    case black_white
    case offwhite_darkgray

}

public extension UIColor {
    static func appColor(ofType colorType: AppColorType) -> UIColor {
        
        switch (colorType) {
        case (.black_white):                  return appColor(named: "black_white")!
        case (.offwhite_darkgray):            return appColor(named: "offwhite_darkgray")!
        
        }
    }
    
    static var black_white: UIColor {
        return appColor(ofType: .black_white)
    }
    
    static var offwhite_darkgray: UIColor {
        return appColor(ofType: .offwhite_darkgray)
    }

}

extension UIColor {
    
    private static func appColor(named: String) -> UIColor?{
           #if TARGET_INTERFACE_BUILDER
           return UIColor.systemGray
           #else
           return UIColor(named: named)
           #endif
       }
}
