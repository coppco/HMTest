//
//  HJProduct.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJProduct.h"

@implementation HJProduct
- (void)setNilValueForKey:(NSString *)key {}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
+ (NSArray *)products {
    NSMutableArray *array = [NSMutableArray array];
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"products" ofType:@"json"]];
    NSArray *array1 = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
    for (NSDictionary *dic in array1) {
        HJProduct *product = [[HJProduct alloc] init];
        [product setValuesForKeysWithDictionary:dic];
        [array addObject:product];
    }
    return array;
}
@end
