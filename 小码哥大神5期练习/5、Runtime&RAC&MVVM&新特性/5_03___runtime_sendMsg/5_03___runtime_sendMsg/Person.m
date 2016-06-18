//
//  Person.m
//  5_03___runtime_sendMsg
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (void)eat:(NSString *)foot {
    NSLog(@"类方法%@", foot);
}
- (void)eat:(NSString *)foot {
    NSLog(@"实例方法%@", foot);
}
@end
