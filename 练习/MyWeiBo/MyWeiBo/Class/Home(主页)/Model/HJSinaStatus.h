//
//  HJSinaStatus.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class HJSinaUser;
#import "HJPhoto.h"

@interface HJSinaStatus : JSONModel
/**UID*/
@property (nonatomic, copy)NSString *idstr;
/**微博内容*/
@property (nonatomic, copy)NSString *text;
/**用户信息*/
@property (nonatomic, copy)HJSinaUser <Optional>*user;
/**创建时间*/
@property (nonatomic, copy)NSString *created_at;
/**来源*/
@property (nonatomic, copy)NSString <Optional>*source;

//原创图片gif
@property (nonatomic, copy)NSString <Optional>*original_pic;

/**微博配图地址, 多图返回多图链接  无图返回空*/
@property (nonatomic, strong)NSArray  <HJPhoto, Optional>*pic_urls;

/**转发微博字段, 当该微博为转发微博的时候返回*/
@property (nonatomic, strong)HJSinaStatus  <Optional>*retweeted_status;

/**toolBar里面数据*/
@property (nonatomic, copy)NSString  <Optional>*attitudes_count; //表态
@property (nonatomic, copy)NSString  <Optional>*reposts_count; //转发
@property (nonatomic, copy)NSString  <Optional>*comments_count; //评论
@end
