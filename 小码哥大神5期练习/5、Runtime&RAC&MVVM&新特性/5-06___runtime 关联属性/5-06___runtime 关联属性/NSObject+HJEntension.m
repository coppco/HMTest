//
//  NSObject+HJEntension.m
//  5-06___runtime 关联属性
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "NSObject+HJEntension.h"
#import <objc/message.h>

const char *kNSObjectKeyName = "name";

@implementation NSObject (HJEntension)
- (NSString *)name {
    return objc_getAssociatedObject(self, kNSObjectKeyName);
}
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, kNSObjectKeyName, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
