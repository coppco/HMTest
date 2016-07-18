//
//  ViewController.swift
//  01-Block
//
//  Created by M-coppco on 16/7/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var person: Person = {
        var gtm: Person = Person()
        gtm.eatClosure = {
            print("gtm eat")
        }
        return gtm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.person.eatClosure != nil) {
            self.person.eatClosure()
        }



        let result = Calculation.makeCalculation { (make: Calculation) -> Void in
            make.a(10).b(20).c(30).d(40)
        }
        print(result)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

