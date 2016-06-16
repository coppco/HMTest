//
//  HJTabBar.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJTabBar.h"
#import "HJTabBarButton.h"
@interface HJTabBar ()
@property (nonatomic, strong)UIButton  *selectButton;
@end

@implementation HJTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
//添加按钮方法
- (void)addTabBarButtonWithNormalBGImage:(NSString *)normal selectBGImage:(NSString *)select {
    HJTabBarButton *button = [HJTabBarButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:(UIControlStateNormal)];
    [button setBackgroundImage:[UIImage imageNamed:select] forState:(UIControlStateSelected)];
    //监听方法
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:button];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        button.tag = i;
        if (0 == i) {
            [self click:button];
        }
        btnX = i * btnW;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
- (void)click:(UIButton *)button {
    _selectButton.selected = NO;
    button.selected = YES;
    _selectButton = button;
    if (self.clickBlock) {
        self.clickBlock(button.tag);
    }
   
}
@end
