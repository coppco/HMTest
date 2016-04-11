//
//  HJLineView.m
//  01-基本图形绘制
//
//  Created by M-coppco on 16/3/29.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJLineView.h"

@implementation HJLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/**
 *  什么时候调用:当视图第一次显示的时候就会调用
 *  作用: 绘制图形
 *  @param rect 相当于self.bounds
 */
- (void)drawRect:(CGRect)rect {
    //1⃣️获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2⃣️设置绘图信息
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置起点
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(150, 150)];
    [path addLineToPoint:CGPointMake(290, 10)];
    //3⃣️把路径添加到上下文中
//    CGContextAddPath(context, path.CGPath);
    [path stroke];
    //设置绘制状态
    
    //4⃣️渲染上下文
//    CGContextStrokePath(context);  //描边
//    CGContextFillPath(context); //填充
}


@end
