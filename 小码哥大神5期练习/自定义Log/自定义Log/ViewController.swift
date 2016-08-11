//
//  ViewController.swift
//  自定义Log
//
//  Created by M-coppco on 16/8/9.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        if let temp = NSBundle.mainBundle().infoDictionary {
            let name = temp["CFBundleExecutable"]
            print(name)
        }
        
        print(product_name!)
        let cls = NSClassFromString("自定义Log." + "ViewController")
        let clsType = cls as! UIViewController.Type
        
        HJLog(clsType.init())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

