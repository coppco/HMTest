//
//  HJStatus.m
//  03-新浪微博
//
//  Created by M-coppco on 16/3/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJStatus.h"

@implementation HJStatus
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)statusWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)statusArray {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self statusWithDict:dic]];
    }
    return arrayM;
}
@end
