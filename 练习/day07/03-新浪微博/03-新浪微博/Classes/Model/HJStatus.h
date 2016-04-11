//
//  HJStatus.h
//  03-新浪微博
//
//  Created by M-coppco on 16/3/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJStatus : NSObject
@property (nonatomic, copy)NSString *text;//正文
@property (nonatomic, copy)NSString *icon;//图标
@property (nonatomic, copy)NSString *name; //名字
@property (nonatomic, copy)NSString *picture;
@property (nonatomic, assign)BOOL vip; //vip
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statusWithDict:(NSDictionary *)dict;
+ (NSArray *)statusArray;
@end
