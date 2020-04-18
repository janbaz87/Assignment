//
//  UIColor+Extensions.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 18/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

public enum AppColorType {
    case primary
    case secondaryBlue
    case secondaryOrange
    case secondaryGreen
    case secondaryMagenta
    case white
    case black
    case separatorGrey
}

public extension UIColor {
    static func appColor(ofType colorType: AppColorType) -> UIColor {
        
        switch (colorType) {
        case (.primary):                  return appColor(named: "universalcolor1")!
        case (.secondaryBlue):            return #colorLiteral(red: 0.2784313725, green: 0.5529411765, blue: 0.9568627451, alpha: 1)
        case (.secondaryOrange):          return #colorLiteral(red: 0.9607843137, green: 0.4980392157, blue: 0.09019607843, alpha: 1)
        case (.secondaryGreen):           return #colorLiteral(red: 0, green: 0.7254901961, blue: 0.6823529412, alpha: 1)
        case (.secondaryMagenta):         return #colorLiteral(red: 0.9568627451, green: 0.2784313725, blue: 0.4549019608, alpha: 1)
        case (.white):                    return .white
        case (.black):                    return .black
        case (.separatorGrey):            return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        }
    }
    
    static var primary: UIColor {
        return appColor(ofType: .primary)
    }
    
    static var secondaryBlue: UIColor {
        return appColor(ofType: .secondaryBlue)
    }
    
    static var secondaryGreen: UIColor {
        return appColor(ofType: .secondaryGreen)
    }
    
    static var secondaryOrange: UIColor {
        return appColor(ofType: .secondaryOrange)
    }
    
    static var secondaryMagenta: UIColor {
        return appColor(ofType: .secondaryMagenta)
    }
}

public extension UIColor {
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

extension UIColor {
    
    static let universalColor1: UIColor = appColor(named: "universalcolor1")!
       
    static let universalColor2: UIColor = appColor(named: "universalcolor2")!
    
    static let universalColor3: UIColor = appColor(named: "universalcolor3")!
    
    static let universalColor4: UIColor = appColor(named: "universalcolor4")!
    
    static let universalColor5: UIColor = appColor(named: "universalcolor5")!
    
    private static func appColor(named: String) -> UIColor?{
           #if TARGET_INTERFACE_BUILDER
           return UIColor.systemGray
           #else
           return UIColor(named: named)
           #endif
       }
}
