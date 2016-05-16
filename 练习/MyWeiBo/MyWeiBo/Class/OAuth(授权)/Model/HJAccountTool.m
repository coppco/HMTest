//
//  HJAccountTool.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/16.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJAccountTool.h"
#import "HJAccount.h"
@implementation HJAccountTool
+ (void)saveAccount:(HJAccount *)account {
    if (!account) {
        return;
    }
    account.create_Date = [NSDate date];
    
    //自定义类写沙盒需要遵循协议 NSCoding协议
    [NSKeyedArchiver archiveRootObject:account toFile:kSinaPlist];

}

+ (HJAccount *)getAccount {
    HJAccount *account  = [NSKeyedUnarchiver unarchiveObjectWithFile:kSinaPlist];
    //验证账号是否过期
    long long expires = [account.expires_in longLongValue];
    
    //过期时间
    NSDate *expries_date = [account.create_Date dateByAddingTimeInterval:expires];
    
    //当前时间
    NSDate *current_date = [NSDate date];
    
    XHJLog(@"%@===%@", current_date, expries_date);
    if ([expries_date compare:current_date] != NSOrderedDescending) {
        return nil;
    }
    return account;
}
@end
