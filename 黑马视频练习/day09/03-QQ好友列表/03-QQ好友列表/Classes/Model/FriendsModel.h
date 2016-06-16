//
//  FriendsModel.h
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VIPType) {
    VIPTypeNO = 0,
    VIPTypeYES
};

@interface FriendsModel : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *intro;
@property (nonatomic, assign)VIPType vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsWithDict:(NSDictionary *)dict;
+ (NSArray *)friendsWith:(NSArray *)array;
@end
