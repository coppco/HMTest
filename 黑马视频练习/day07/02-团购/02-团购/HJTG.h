//
//  HJTG.h
//  02-团购
//
//  Created by M-coppco on 16/3/9.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJTG : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *buyCount;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict;
+ (NSArray *)tgArray;
@end
