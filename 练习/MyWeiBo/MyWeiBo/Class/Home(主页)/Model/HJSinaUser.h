//
//  HJSinaUser.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <JSONModel/JSONModel.h>

typedef NS_ENUM(NSInteger, HJStatusVerifiedType) {
    HJStatusVerifiedTypeNone = -1,  //没有认证
    HJStatusVerifiedTypePerson = 0, //个人
    HJStatusVerifiedTypeOrgEnterprice = 2,//企业
    HJStatusVerifiedTypeOrgMedia = 3, //媒体官方
    HJStatusVerifiedTypeWensite = 5, //网站官方
    
    HJStatusVerifiedTypeDaren = 220 //微博达人
};

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

/*认证类型 */
@property (nonatomic, assign)HJStatusVerifiedType verified_type;
@property (nonatomic, assign)NSNumber <Optional> *isVip;
@end
