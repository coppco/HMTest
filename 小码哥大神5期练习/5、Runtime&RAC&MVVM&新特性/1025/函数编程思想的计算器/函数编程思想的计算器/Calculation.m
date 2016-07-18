//
//  Calculation.m
//  函数编程思想的计算器
//
//  Created by coco on 16/7/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "Calculation.h"

@implementation Calculation

- (instancetype)Calculation:(float (^)(float))block {
    if (block) {
        _result = block(_result);
    }
    return self;
}

@end
