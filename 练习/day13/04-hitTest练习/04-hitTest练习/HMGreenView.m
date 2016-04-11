//
//  HMGreenView.m
//  04-hitTest练习
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMGreenView.h"

@implementation HMGreenView


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    // 把自己的点转换按钮的坐标系上的点
//    CGPoint buttonPoint = [self convertPoint:point toView:_button];
//    
//    if ([_button pointInside:buttonPoint withEvent:event]) return nil;
//
//    
//    return [super hitTest:point withEvent:event];
//}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    // 把左边控件上的点转换为右边上边控件的点
//    CGPoint buttonPoint = [self convertPoint:point toView:_button];
    
    // 从右边这个view上的点转换为坐标上的点
    CGPoint buttonPoint =[_button convertPoint:point fromView:self];
    if ([_button pointInside:buttonPoint withEvent:event]) return NO;
    
    
    return [super pointInside:point withEvent:event];
}


@end
