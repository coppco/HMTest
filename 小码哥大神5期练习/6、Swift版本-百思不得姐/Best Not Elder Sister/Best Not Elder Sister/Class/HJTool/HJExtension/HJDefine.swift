//
//  HJDefine.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import Foundation
import UIKit

/**主屏幕*/
let kHJMainScreen = UIScreen.mainScreen()

/**主屏幕bounds*/
let kHJMainScreenBounds = kHJMainScreen.bounds

/**主屏幕的size*/
let kHJMainScreenSize = kHJMainScreenBounds.size

/**主屏幕的宽*/
let kHJMainScreenWidth = kHJMainScreenSize.width

/**主屏幕的高*/
let kHJMainScreenHeight = kHJMainScreenSize.height

/**是否是iPhone 4*/
let is_iPhone4: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(320, 480)) && kHJMainScreen.scale == 1.0

/**是否是iPhone 4S*/
let is_iPhone4s: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(320, 480)) && kHJMainScreen.scale == 2.0

/**是否是iPhone 5 or iPhone 5S*/
let is_iPhone5: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(320, 568))

/**是否是iPhone 6 or iPhone 6S*/
let is_iPhone6: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(375, 667))

/**是否是iPhone 6 Plus or iPhone 6S Plus*/
let is_iPhone6p: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(414, 736))

/**是否第一次登陆*/
let is_First:String = "isFirst"

//Swift2.2后使用#line #file #function #column替换__LINE__等
//这里文件名file和行数line使用参数,并且给它默认值__FILE__等,这样在哪里调用就是哪个文件名和行数.而不能直接在函数中使用__FILE__等,不然打印出来都是HJLog所在的文件名和行数
func HJLog(items: Any..., file:String = __FILE__, line:Int = __LINE__) {
    #if DEBUG
        var fileString = "======时间:\(NSDate())" + " 文件名:\((file as NSString).lastPathComponent)" + " 行数:\(line)======\n"
        for item in items {
            fileString += (String(item) + " ")
        }
        print(fileString)
    #else
    #endif
}




