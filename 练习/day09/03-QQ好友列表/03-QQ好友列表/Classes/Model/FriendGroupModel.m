//
//  FriendGroupModel.m
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "FriendGroupModel.h"
#import "FriendsModel.h"
@implementation FriendGroupModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendGroupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)friendGroups {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self friendGroupWithDict:dic]];
    }
    return arrayM;
}
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"friends"]) {
        self.friends = [FriendsModel friendsWith:value];
    }
}
@end
