//
//  UIColor+HJExtension.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/7/24.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**随机颜色*/
    class func hj_randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(255)) / 256.0, green: CGFloat(arc4random_uniform(255)) / 256.0, blue: CGFloat(arc4random_uniform(255)) / 256.0, alpha: 1.0)
    }
    
    /**16进制颜色*/
    class func hj_colorFromRGBValue(value: UInt32) -> UIColor{
        let red: CGFloat = CGFloat((value >> 24) & 0xFF) / 255.0
        let green: CGFloat = CGFloat((value >> 16) & 0xFF) / 255.0
        let blue: CGFloat = CGFloat((value >> 8) & 0xFF) / 255.0
        let alpha: CGFloat = CGFloat((value >> 0) & 0xFF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**从字符串获取颜色*/
    class func hj_colorFromHexString(var value: String) -> UIColor{
        if value.characters.count <= 0 {
            return UIColor.clearColor()
        }
        if value.hasPrefix("#") {
            value = value.stringByReplacingOccurrencesOfString("#", withString: "")
        }
        let scanner = NSScanner(string: value)
        var result:UInt32 = UInt32()
        if !scanner.scanHexInt(&result) {
            return UIColor.clearColor()
        }
        return hj_colorFromRGBValue(result)
    }
}
