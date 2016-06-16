//
//  FriendGroupModel.h
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroupModel : NSObject
@property (nonatomic, copy)NSString *name;
/**
 *  friend是C++关键字  所以不要定义这个变量
 */
@property (nonatomic, strong)NSArray  *friends;
@property (nonatomic, assign)NSInteger  online;

//添加一个字段  控制打开和关闭
@property (nonatomic, assign)BOOL  open;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDict:(NSDictionary *)dict;
+ (NSArray *)friendGroups;
@end
