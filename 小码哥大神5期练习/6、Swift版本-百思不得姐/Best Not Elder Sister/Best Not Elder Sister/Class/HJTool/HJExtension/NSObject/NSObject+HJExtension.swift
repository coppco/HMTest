//
//  NSObject+HJExtension.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/8/1.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import Foundation

@objc public protocol ObjectShouldMapProtocol {
    
}
extension NSObject {
    
    /**改变key*/
    class func changKeys() -> [String: String]? {
        return ["":""]
    }
    /**数组中存放model*/
    class func CustomerInArray() ->  [String: String]?{
        return ["":""]
    }

    
    /**字典转模型*/
    class func dictionaryToModel(dic: NSDictionary) -> AnyObject? {
        let object: AnyObject = self.init()
        var className: AnyClass = self.classForCoder()  //当前类的类型  或者使用类名.self获取
        
        while "NSObject" != "\(className)" {
            var count: UInt32 = 0
            let properties = class_copyPropertyList(className, &count)
            
            for i in 0 ..< count {
                let property: objc_property_t = properties[Int(i)]  //单个属性
                let propertyType = String.fromCString(property_getAttributes(property))! //属性类型
                var propertyName: String = String.fromCString(property_getName(property))! //属性名称
                if propertyType == "description" { continue }
                
                
                if var value = dic.objectForKey(propertyName) {
                    let valueType = "\(value.classForCoder)"  //字典中存放的数据类型
                    
                    if "NSDictionary" == valueType {
                        //嵌套
                        if let subModelString = self.getCustomerType(propertyType) {
                            if let subModelClass: AnyClass = NSClassFromString(subModelString) {
                                value = subModelClass.dictionaryToModel(value as! NSDictionary)! //递归
                            }
                        } else {
                            print("\(propertyName)需要一个自定义模型")
                        }
                    } else if "NSArray" == valueType {
                        if self.respondsToSelector("CustomerInArray") {
                            if var subModelClassName = className.CustomerInArray()![propertyName] {
                                subModelClassName = bundleName + "." + subModelClassName
                                if let subModelClass = NSClassFromString(subModelClassName){
                                    if let array = subModelClass.arrayOfDicToArrayOfModel(value as! NSArray) {
                                        value = array
                                    }
                                }
                            }
                        }
                    }
                    //这里可以设置映射, 改变key值的情况
                    if self.respondsToSelector("changKeys") {
                        if let dic = self.changKeys() {
                            if let temp = dic[propertyName] {
                                propertyName = temp
                            }
                        }
                    }
                    object.setValue(value, forKey: propertyName)
                }
            }
            free(properties)                            //释放内存
            className = className.superclass()!                     //处理父类
        }
        
        return object
    }
    
    
    class func arrayOfDicToArrayOfModel(array: NSArray) -> NSArray? {
        if array.count == 0 {
            return nil
        }
        var result = [AnyObject]()
        for item in array{
            let type = "\(item.classForCoder)"
            if type == "NSDictionary"{
                if let model = dictionaryToModel(item as! NSDictionary){
                    result.append(model)
                }
            }else if type == "NSArray"{
                if let model =  arrayOfDicToArrayOfModel(item as! NSArray){
                    result.append(model)
                }
            }else{
                result.append(item)
            }
        }
        if result.count==0{
            return nil
        }else{
            return result
        }
    }
    
     /**
     获取自定义类的类名, 自定义类
     
     - parameter code: String.fromCString(property_getAttributes(property))!获取到的类名,如果是自定义类型,会包含其他字符等, 如T@"_TtC15工程名4User",N,&,Vuser  或者  T@"NSString",N,C,Vname======
     - returns:
     */
     private class func getCustomerType(code: String) -> String? {
        
        if !code.containsString(bundleName) {
            return nil
        }
        var temp: String = ""
        let array = code.componentsSeparatedByString("\"")
        if array.count >= 1 {
            temp = array[1]
        }
        if let range = temp.rangeOfString(bundleName) {
            temp = temp.substringFromIndex(range.endIndex)
            var number: String = ""  //类名前面的数字
            for c: Character in temp.characters {
                if c >= "0" && c <= "9" {
                    number += String(c)
                }
            }
            if let range = temp.rangeOfString(number) {
                temp = temp.substringFromIndex(range.endIndex)
            }
            return bundleName + "." + temp
        }
        return nil
    }
    
    
}
/**工程名称*/
private let bundleName = (NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"]?.stringByReplacingOccurrencesOfString(" ", withString: "_"))! as String
//private let bundleName = NSBundle.mainBundle().bundlePath.componentsSeparatedByString("/").last!.componentsSeparatedByString(".").first!


