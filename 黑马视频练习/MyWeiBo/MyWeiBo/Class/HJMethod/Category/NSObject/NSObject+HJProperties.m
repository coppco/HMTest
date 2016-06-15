//
//  NSObject+HJProperties.m
//  HJCommonTool
//
//  Created by coco on 16/3/24.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "NSObject+HJProperties.h"
#import <objc/runtime.h>  //使用运行时需要包含头文件
@implementation NSObject (HJProperties)
+ (NSArray *)HJProperties {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        [array addObject:name];
    }
    Class class = class_getSuperclass(self);
    while (![NSStringFromClass(class) isEqualToString:NSStringFromClass([NSObject class])]) {
        if ([class HJProperties] != nil) {
            [array addObject:[class HJProperties]];
        } else {
    }
    return array;
    }
    return array;
}
@end
