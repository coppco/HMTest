//
//  HJHelpModel.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJHelpModel.h"

@implementation HJHelpModel
+ (NSArray *)help {
    NSMutableArray *array = [NSMutableArray array];
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil]];
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
    for (NSDictionary *dic in dataArray) {
        HJHelpModel *model = [[HJHelpModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [array addObject:model];
    }
    return array;
}
- (void)setNilValueForKey:(NSString *)key {}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
