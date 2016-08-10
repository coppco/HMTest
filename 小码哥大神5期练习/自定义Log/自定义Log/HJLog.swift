//
//  HJLog.swift
//  自定义Log
//
//  Created by M-coppco on 15/11/9.
//  Copyright © 2015年 M-coppco. All rights reserved.
//

import Foundation

/**
 自定义Log
 - 需要在Build Setting --->  custom flags ---> Other Swift Flags ---->  Debug 里面添加 -D DEBUG, 当发布release版本的时候不会打印, DEBUG模式才会输出!
 
 - parameter items:        需要打印的参数, 多参数,Any类型
 - parameter fileName:     文件名, 使用默认值
 - parameter functionName: 函数名称, 使用默认值
 - parameter lineNumber:   行数, 使用默认值
 */

func HJLog(items: Any..., fileName: String = __FILE__, functionName: String = __FUNCTION__, lineNumber: Int = __LINE__) {
    #if DEBUG
    var string = "文件:\((fileName as NSString).lastPathComponent) 方法:\(functionName) [\(lineNumber)行]"
    for item in items {
        string.appendContentsOf(" \(item)")
    }
    print(string)
    #endif
}
