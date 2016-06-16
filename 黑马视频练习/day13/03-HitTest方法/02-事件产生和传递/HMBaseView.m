//
//  HMBaseView.m
//  02-事件产生和传递
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMBaseView.h"

@implementation HMBaseView

// 获取当前方法在哪个类里面调用
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@----------touchesBegan",[self class]);
}

// 找最合适的view
// point是白色View的坐标系上的点
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 1.判断自己能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    
    // 2.判断点在不在当前控件上面
    if (![self pointInside:point withEvent:event]) return nil;
    
    // 3.去找有没有比自己更合适的view
    // 从后往前遍历自己的子控件
    int count = self.subviews.count;
    
    for (int i = count - 1; i >= 0; i--) {
        // 获取子控件
        UIView *childView = self.subviews[i];
        
        // 转换坐标系
        // 把自己坐标系上的点转换成子控件做坐标系上的点
        CGPoint childPoint = [self convertPoint:point toView:childView];
        
        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        // 找到最合适的view
        if (fitView) {
            return fitView;
        }
        
    }
    
    // 没有找到比自己更合适的view
    return self;
}

@end
