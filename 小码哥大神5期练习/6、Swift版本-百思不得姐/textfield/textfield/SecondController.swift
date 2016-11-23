//
//  SecondController.swift
//  textfield
//
//  Created by coco on 16/8/16.
//  Copyright © 2016年 XHJ. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    @IBOutlet weak var passwordT: UITextField!
    @IBOutlet weak var nameT: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordT.configTextField { (make) -> Void in
            make.length = 5
        }
    }
}
