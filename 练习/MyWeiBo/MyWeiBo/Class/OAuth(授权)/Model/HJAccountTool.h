//
//  HJAccountTool.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/16.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HJAccount;
@interface HJAccountTool : NSObject
/**
 *  @author XHJ, 16-05-16 21:05:13
 *
 *  存储账号信息
 *
 *  @param account 账号
 */
+ (void)saveAccount:(HJAccount *)account;
/**
 *  @author XHJ, 16-05-16 21:05:23
 *
 *  获取账号
 *
 *  @return 账号
 */
+ (HJAccount *)getAccount;
@end
