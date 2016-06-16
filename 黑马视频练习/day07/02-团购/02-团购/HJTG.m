//
//  HJTG.m
//  02-团购
//
//  Created by M-coppco on 16/3/9.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJTG.h"

@implementation HJTG
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)tgWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)tgArray {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self tgWithDict:dic]];
    }
    return arrayM;
}
@end
