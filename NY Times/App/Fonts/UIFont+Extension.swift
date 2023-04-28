//
//  UIFont+Extension.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//


import UIKit

extension UIFont {
    
    class func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: Quicksand.bold, size: size) ?? UIFont()
    }
    
    class func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: Quicksand.light, size: size ) ?? UIFont()
    }
    
    class func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: Quicksand.medium, size: size ) ?? UIFont()
    }
    
    class func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: Quicksand.regular, size: size ) ?? UIFont()
    }
    
    class func semibold(_ size: CGFloat) -> UIFont {
        return UIFont(name: Quicksand.semibold, size: size ) ?? UIFont()
    }
    
}

struct Quicksand {
    static let bold = "Quicksand-Bold"
    static let light = "Quicksand-Light"
    static let medium = "Quicksand-Medium"
    static let regular = "Quicksand-Regular"
    static let semibold = "Quicksand-SemiBold"
}

struct FontSizes {
    private init(){}
    
    static let font_xs: CGFloat = 20
    static let font_s: CGFloat = 22
    static let font_m: CGFloat = 24
    static let font_l: CGFloat = 26
    static let font_xl: CGFloat = 28
    static let font_2xl: CGFloat = 30
    static let font_3xl: CGFloat = 32

}
