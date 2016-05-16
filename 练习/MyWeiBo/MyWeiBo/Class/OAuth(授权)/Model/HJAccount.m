//
//  HJAccount.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/16.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJAccount.h"

@implementation HJAccount

/**
 *  @author XHJ, 16-05-16 20:05:10
 *
 *  当一个对象要归档成data的时候
 *
 *  @param aCoder
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.create_Date forKey:@"create_Date"];
}
//反归档方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.create_Date = [aDecoder decodeObjectForKey:@"create_Date"];
    }
    return self;
}
@end
