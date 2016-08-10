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
        print(1, 2, "4")
        HJLog(1, 2, "4", self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

