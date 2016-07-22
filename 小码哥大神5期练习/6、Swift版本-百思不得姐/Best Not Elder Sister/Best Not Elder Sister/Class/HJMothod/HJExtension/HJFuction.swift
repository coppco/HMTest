//
//  HJFuction.swift
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
let __isIphone4: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(320, 480)) && kHJMainScreen.scale == 1.0

/**是否是iPhone 4S*/
let __isIphone4s: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(320, 480)) && kHJMainScreen.scale == 2.0

/**是否是iPhone 5 or iPhone 5S*/
let __isIphone5: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(320, 568))

/**是否是iPhone 6 or iPhone 6S*/
let __isIphone6: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(375, 667))

/**是否是iPhone 6 Plus or iPhone 6S Plus*/
let __isIphone6p: Bool = CGSizeEqualToSize(kHJMainScreenSize, CGSizeMake(414, 736))

let isFirst:String = "isFirst"
