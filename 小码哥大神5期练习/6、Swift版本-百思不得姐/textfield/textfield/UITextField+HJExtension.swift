import UIKit

extension UITextField {
    func configTextField(@noescape closure: (make:Container) -> Void) -> Void {
        Container.container(self, closure: closure)
    }
}

class Container: NSObject {
    /**控制文本长度*/
    internal var length: Int = Int.max
    /**文本开始编辑block*/
    internal var textFieldDidBeginEditing: ((UITextField) -> Void)?
    internal var textFieldDidEndEditing: ((UITextField) -> Void)?
    internal var textFieldShouldBeginEditing: ((UITextField) -> Bool)?
    internal var textFieldShouldClear: ((UITextField) -> Bool)?
    internal var textFieldShouldEndEditing: ((UITextField) -> Bool)?
    internal var textFieldShouldReturn: ((UITextField) -> Bool)?
    
    static var make: Container = Container()
    
    internal class func container(textField: UITextField, @noescape closure: (make: Container) -> Void) -> Void {
        let make = Container.make
        closure(make: make)
        NSNotificationCenter.defaultCenter().addObserver(make, selector: Selector("make1:"), name: UITextFieldTextDidChangeNotification, object: textField)
    }
    
    func make1(notify: NSNotification) {
        if let textField = notify.object as? UITextField {
            if let text = textField.text {
                
                let predicate = NSPredicate(format: "length", self.length)
                print(predicate.evaluateWithObject(text))
            }
        }
    }
}


