//
//  HJSquare.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/27.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import SwiftyJSON


class HJSquare: NSObject {
    var android: String?
    /**图片*/
    var icon: String = ""
    var id: NSNumber?
    var ipad: String?
    var iphone: String?
    var market: String?
     /**名字*/
    var name: String = ""
     /**链接*/
    var url: String = ""
    
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    override func setNilValueForKey(key: String) {
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
