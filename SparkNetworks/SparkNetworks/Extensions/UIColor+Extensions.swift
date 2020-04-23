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
    case blue_white
    case blue_grey
    case grey_grey

}

public extension UIColor {
    static func appColor(ofType colorType: AppColorType) -> UIColor {
        
        switch (colorType) {
        case (.black_white):                  return appColor(named: "black_white")!
        case (.offwhite_darkgray):            return appColor(named: "offwhite_darkgray")!
        case (.blue_white):                   return appColor(named: "blue_white")!
        case (.blue_grey):                    return appColor(named: "blue_grey")!
        case (.grey_grey):                    return appColor(named: "grey_grey")!
        }
    }
    
    static var black_white: UIColor {
        return appColor(ofType: .black_white)
    }
    
    static var offwhite_darkgray: UIColor {
        return appColor(ofType: .offwhite_darkgray)
    }
    
    static var blue_white: UIColor {
        return appColor(ofType: .blue_white)
    }
    
    static var blue_grey: UIColor {
        return appColor(ofType: .blue_grey)
    }
    
    static var grey_grey: UIColor {
        return appColor(ofType: .grey_grey)
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
