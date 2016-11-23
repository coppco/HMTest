////
////  HJTextField.swift
////  textfield
////
////  Created by coco on 16/8/8.
////  Copyright © 2016年 XHJ. All rights reserved.
////
//
//import UIKit
//
//let HJ_INPUT_PHONE_NUMBER = ""
//let HJ_INPUT_INT = ""
//let HJ_INPUT_FLOAT = ""
//
//
//class HJTextField: UITextField {
//    private static var HJ_TEXT_LENGTH = "HJ_TEXT_LENGTH"
//    /**文本最大长度, 默认UInt.max*/
//    var hj_textLength: UInt {
//        get {
//            if let temp = objc_getAssociatedObject(self, &HJTextField.HJ_TEXT_LENGTH) as? UInt {
//                return temp
//            }
//            return UInt.max
//        }
//        set {
//            objc_setAssociatedObject(self, &HJTextField.HJ_TEXT_LENGTH, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//    
//    
//    
//    init () {
//        super.init(frame: CGRectZero)
//        addNotification()
//    }
//    override init(frame: CGRect) {
//        super.init(frame: CGRectZero)
//        addNotification()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        addNotification()
//    }
//    
//    private func addNotification() {
////        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hj_textHasChanged:", name: UITextFieldTextDidChangeNotification, object: self)
//        self.addTarget(self, action: "hj_textHasChanged:", forControlEvents: UIControlEvents.EditingChanged)
//    }
//    deinit {
//        print("销毁了")
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextFieldTextDidChangeNotification, object: self)
//    }
//    
//    internal func hj_textHasChanged(userInfo: NSNotification) {
//        if let temp = self.text {
//            if temp.characters.count > Int(self.hj_textLength) {
//                let index = temp.startIndex.advancedBy(Int(self.hj_textLength))
//                self.text = temp.substringToIndex(index)
//            }
//            
//            //处理正则表达式
//            
//        }
//        
//    }
//}