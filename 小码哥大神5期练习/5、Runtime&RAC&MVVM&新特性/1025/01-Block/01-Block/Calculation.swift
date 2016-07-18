//
//  Calculation.swift
//  01-Block
//
//  Created by M-coppco on 16/7/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class Calculation: NSObject {
    var result: Float = 0
    func a(number: Float) ->Calculation {
        self.result += number
       return self
    }
    
    func b(number: Float) ->Calculation {
        self.result -= number
        return self
    }
    
    func c(number: Float) ->Calculation {
        self.result *= number
        return self
    }
    
    func d(number: Float) ->Calculation {
        self.result /= number
        return self
    }
}


extension Calculation {
    class func makeCalculation(closure:(Calculation) -> Void) -> Float {
        let make: Calculation = Calculation()
        closure(make)
        return make.result
    }
}
