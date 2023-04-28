//
//  UIButton+EX.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import Foundation
import UIKit

extension UIButton {
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
}
