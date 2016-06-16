//
//  HJTabBar.h
//  01-Lottery
//
//  Created by M-coppco on 16/4/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJTabBar : UIView
@property (nonatomic, copy)void(^clickBlock)(NSInteger index);  //点击button的block
/**
 *  添加button方法
 *
 *  @param normal 正常状态下背景图片名称
 *  @param select 选中状态下背景图片名称
 */
- (void)addTabBarButtonWithNormalBGImage:(NSString *)normal selectBGImage:(NSString *)select;
@end
