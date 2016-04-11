//
//  Info.m
//  day03应用程序管理
//
//  Created by M-coppco on 16/1/6.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "Info.h"

@implementation Info
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (Info *)infoWithDictionary:(NSDictionary *)dic {
    return [[self alloc] initWithDictionary:dic];
}
-(void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"icon"]) {
        self.icon = value;
        self.image = [UIImage imageNamed:value];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {

}
-(void)setNilValueForKey:(NSString *)key {}
+(NSArray *)appList {
    NSArray *array = [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self infoWithDictionary:dic]];
    }
    return arrayM;
}
@end
