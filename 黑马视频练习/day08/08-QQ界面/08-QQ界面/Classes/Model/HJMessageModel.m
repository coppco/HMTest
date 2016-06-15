//
//  HJMessageModel.m
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJMessageModel.h"

@implementation HJMessageModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)messageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)messageArray {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self messageWithDict:dic]];
    }
    return arrayM;
}
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
//- (void)setNilValueForKey:(NSString *)key {}
@end
