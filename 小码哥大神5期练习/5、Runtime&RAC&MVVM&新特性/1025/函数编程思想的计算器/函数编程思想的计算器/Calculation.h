//
//  Calculation.h
//  函数编程思想的计算器
//
//  Created by coco on 16/7/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculation : NSObject

/**结果*/
@property (nonatomic, assign)float result;

- (instancetype)Calculation:(float (^)(float))block;
@end
