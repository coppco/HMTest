//
//  Question.h
//  day04超级猜图
//
//  Created by M-coppco on 16/1/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Question : NSObject
@property (nonatomic, copy)NSString *answer;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)NSArray *options;
@property (nonatomic, strong)UIImage *image1;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)questionWithDictionary:(NSDictionary *)dic;
//从plist返回
+ (NSArray *)question;
//打乱备选答案的数组
- (void)randomOption;
@end
