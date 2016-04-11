//
//  AppView.h
//  day03应用程序管理
//
//  Created by M-coppco on 16/1/12.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Info;
//协议
@protocol AppViewDelegate <NSObject>
@required
- (void)appViewButtonShouldClick:(Info *)info;
@end
@interface AppView : UIView
//加载方法
+ (AppView *)appView;
+ (AppView *)appViewWithInfo:(Info *)info;
@property (nonatomic, strong)Info *info;
//代理
@property (nonatomic, assign)id <AppViewDelegate>delegate;

@end
