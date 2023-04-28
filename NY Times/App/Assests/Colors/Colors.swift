//
//  Colors.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//


import UIKit
enum Colors: String {
    case main
    case white
    case gray
    case shadow
    case clear
    case black
    case bg

    var color: UIColor {
        return UIColor(named: self.rawValue) ?? UIColor()
    }
}
