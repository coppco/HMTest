//
//  HJContact.m
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJContact.h"

@implementation HJContact
- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone {
    self = [super init];
    if (self) {
        self.name = name;
        self.phone = phone;
    }
    return self;
}
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone {
    return [[self alloc] initWithName:name phone:phone];
}
@end
