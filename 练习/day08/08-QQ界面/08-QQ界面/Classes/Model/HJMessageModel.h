//
//  HJMessageModel.h
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, HJMessageType) {
    HJMessageTypeGatsby = 0,  //Gatsby
    HJMessageTypeJobs  //Jobs
};
@interface HJMessageModel : NSObject
@property (nonatomic, copy)NSString *text;//正文
@property (nonatomic, copy)NSString *time; //时间
@property (nonatomic, assign)HJMessageType type;  //类型  可以使用枚举类型
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)messageWithDict:(NSDictionary *)dict;
+ (NSArray *)messageArray;
@end
