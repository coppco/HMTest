//
//  HJContact.h
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJContact : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *phone;
- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone;
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;
@end
