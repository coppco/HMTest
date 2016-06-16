//
//  HMWhite.m
//  02-事件产生和传递
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMWhite.h"

@implementation HMWhite

// 什么时候调用：当事件传递给一个控件的时候就会调用
// 作用：找最合适的view

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    // 寻找最合适的view
//    
//    UIView *fitView = [super hitTest:point withEvent:event];
////    NSLog(@"%@",fitView);
//    return fitView;
//}

/**
 *  判断点在不在方法调用者的坐标系上
 *  point:是方法调用者的坐标系上的点
 */
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    
//    return NO;
//}




@end
