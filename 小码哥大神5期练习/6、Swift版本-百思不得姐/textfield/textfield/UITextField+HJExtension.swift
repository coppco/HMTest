////
////  UITextField+HJExtension.swift
////  textfield
////
////  Created by coco on 16/8/8.
////  Copyright © 2016年 XHJ. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//extension UITextField {
//    /**Associated键*/
//    private struct HJ_AssociatedKeys {
//        /**文本长度key*/
//        static var HJ_TEXT_LENGTH = "HJ_TEXT_LENGTH"
//        /**输入类型key*/
//        static var HJ_INPUT_TYPE = "HJ_INPUT_TYPE"
//    }
//    
//    /**输入类型枚举*/
//    enum INPUT_TYPE: String {
//        case None = "None"  //未设置
//        case Int = "Int"  //整数
//        case Float = "Float"   //小数
//        case Letter = "Letter" //字母
//    }
//
//    
//    /**文本长度*/
//    var hj_textLength: UInt {
//        get {
//            if let temp = objc_getAssociatedObject(self, &HJ_AssociatedKeys.HJ_TEXT_LENGTH) as? UInt {
//                return temp
//            }
//            return 0
//        }
//        set {
//            if hj_textLength == newValue {
//                return
//            }
//            objc_setAssociatedObject(self, &HJ_AssociatedKeys.HJ_TEXT_LENGTH, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            if newValue >= 1 {
//                if !self.allTargets().contains(self) {
//                    self.addTarget(self, action: "hj_textHasChanged:", forControlEvents: UIControlEvents.EditingChanged)
//                }
//            } else {
//                if self.allTargets().contains(self) {
//                    self.removeTarget(self, action: "hj_textHasChanged:", forControlEvents: UIControlEvents.EditingChanged)
//                }
//            }
//        }
//    }
//    
//     func hj_textHasChanged(textField: UITextField) {
//        if let temp = textField.text {
//            if temp.characters.count > Int(self.hj_textLength) {
//                let index = temp.startIndex.advancedBy(Int(self.hj_textLength))
//                self.text = temp.substringToIndex(index)
//            }
//            switch self.hj_inputType {
//            case .None:
//                break
//            case .Float:
//                break
//            case .Int:
//                let pre = NSPredicate(format: "SELF MATCHES %@", <#T##args: CVarArgType...##CVarArgType#>)
//                break
//            case .Letter:
//                break
//            }
//        }
//    }
//    
//    
//    /**输入类型*/
//    var hj_inputType: INPUT_TYPE {
//        get {
//            if let temp = objc_getAssociatedObject(self, &HJ_AssociatedKeys.HJ_INPUT_TYPE) as? String {
//                if let value = INPUT_TYPE(rawValue: temp) {
//                    return value
//                }
//                return .None
//            }
//            return .None
//        }
//        set {
//            if hj_inputType == newValue {
//                return
//            }
//            objc_setAssociatedObject(self, &HJ_AssociatedKeys.HJ_INPUT_TYPE, newValue.rawValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            hj_inputWith(newValue)
//        }
//    }
//    
//    func hj_inputWith(type: INPUT_TYPE) {
//        switch type {
//        case .None:
//            if self.allTargets().contains(self) && self.hj_textLength == 0 {
//                self.removeTarget(self, action: "textHasChanged:", forControlEvents: UIControlEvents.EditingChanged)
//            }
//            break
//        case .Float:
//            fallthrough
//        case .Int:
//            fallthrough
//        case .Letter:
//            if !self.allTargets().contains(self) {
//                self.addTarget(self, action: "textHasChanged:", forControlEvents: UIControlEvents.EditingChanged)
//            }
//        }
//    }
//}