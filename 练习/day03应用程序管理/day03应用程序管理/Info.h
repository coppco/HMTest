//
//  Info.h
//  day03应用程序管理
//
//  Created by M-coppco on 16/1/6.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Info : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)UIImage *image;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (Info *)infoWithDictionary:(NSDictionary *)dic;
+ (NSArray *)appList;
@end
