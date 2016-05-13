//
//  HJTabBar.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/1.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJTabBar.h"

@interface HJTabBar ()
@property (nonatomic, strong)UIButton  *addButton;
@end

@implementation HJTabBar

- (instancetype)init {
    self  = [super init];
    if (self) {
        self.addButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:(UIControlStateNormal)];
        [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:(UIControlStateHighlighted)];
        [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:(UIControlStateNormal)];
        [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:(UIControlStateNormal)];
        self.addButton.size = self.addButton.currentBackgroundImage.size;
        [self.addButton addTarget:self action:@selector(buttonClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.addButton];
        
    }
    return self;
}
- (void)buttonClick {
    if (self.click) {
        self.click();
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置加号按钮的位置
    self.addButton.centerX = self.width * 0.5;
    self.addButton.centerY = self.height * 0.5;
    
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        
        if ([view isKindOfClass:class]) {
            view.width = tabbarButtonW;
            view.x = tabbarButtonW * tabbarButtonIndex;
            tabbarButtonIndex++;
            
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
            
        }
    }
}

@end
