//
//  FriendsModel.m
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)friendsWith:(NSArray *)array {
    NSMutableArray *array1 = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [array1 addObject:[self friendsWithDict:dic]];
    }
    return array1;
}

@end
