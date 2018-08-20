//
//  UIColor+Additions.swift
//  E-dinar
//
//  Generated on Zeplin. (03.07.2018).
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

import UIKit

extension UIColor {

  @nonobjc class var greySeparator: UIColor {
        return UIColor(red: 216.0 / 255.0, green: 216.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
    }
    
  @nonobjc class var kBackground: UIColor {
    return UIColor(red: 247.0 / 255.0, green: 249.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kBlackTint: UIColor {
    return UIColor(white: 0.0, alpha: 0.4)
  }

  @nonobjc class var kSeparator: UIColor {
    return UIColor(red: 228.0 / 255.0, green: 232.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kTextGray: UIColor {
    return UIColor(white: 155.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kBackgroundGray: UIColor {
    return UIColor(red: 245.0 / 255.0, green: 246.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kTomato: UIColor {
    return UIColor(red: 225.0 / 255.0, green: 70.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kGreyishBrown: UIColor {
    return UIColor(white: 74.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kEggshell: UIColor {
    return UIColor(red: 238.0 / 255.0, green: 1.0, blue: 220.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kTurtleGreen: UIColor {
    return UIColor(red: 139.0 / 255.0, green: 198.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var kTextGray70: UIColor {
    return UIColor(white: 155.0 / 255.0, alpha: 0.7)
  }

  @nonobjc class var kBloodOrange: UIColor {
    return UIColor(red: 1.0, green: 83.0 / 255.0, blue: 4.0 / 255.0, alpha: 1.0)
  }
}

extension UIView {
    func addBottomShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func addTopShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: -2)
    }
    
    func addTopContainerShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: -4)
    }
    
    func addContainerShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    func clearShadow() {
        layer.shadowOpacity = 0
        layer.shadowRadius = 0
    }
    
}
