//
//  HJAccount.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/16.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HJAccount : JSONModel<NSCoding>
@property (nonatomic, copy)NSString *access_token;  //令牌
@property (nonatomic, copy)NSString *expires_in; //过期时间
@property (nonatomic, copy)NSString *uid;  //相当于用户id
@property (nonatomic, strong)NSDate <Optional>*create_Date;  //获取账号的时间
@property (nonatomic, copy)NSString <Optional>*name;  //昵称
@end
