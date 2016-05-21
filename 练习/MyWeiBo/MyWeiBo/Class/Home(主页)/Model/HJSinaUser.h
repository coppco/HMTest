//
//  HJSinaUser.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HJSinaUser : JSONModel
/*用户名*/
@property (nonatomic, copy)NSString *name;
/*用户头像*/
@property (nonatomic, copy)NSString *profile_image_url;
/*UID*/
@property (nonatomic, copy)NSString *idstr;
/*大于2 是vip*/
@property (nonatomic, assign)int  mbtype;

@property (nonatomic, assign)int  mbrank;
@property (nonatomic, assign)NSNumber <Optional> *isVip;
@end
