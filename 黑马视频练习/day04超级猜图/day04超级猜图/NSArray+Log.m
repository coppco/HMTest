//
//  NSArray+Log.m
//  day04超级猜图
//
//  Created by M-coppco on 16/1/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
//本地化描述
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    for (id object in self) {
        [strM appendFormat:@"\t%@\n", object];
    }
    [strM appendString:@")\n"];
    return strM;
}
@end
