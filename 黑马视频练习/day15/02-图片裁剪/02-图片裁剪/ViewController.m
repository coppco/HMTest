//
//  ViewController.m
//  02-图片裁剪
//
//  Created by M-coppco on 16/4/5.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self clipImage];  //裁剪图片
    
    [self clipImageWithBianKuang];  //带边框的裁剪
    
}
- (void)clipImageWithBianKuang {
    CGFloat borderW = 5;
    
    //加载旧图片
    UIImage *old = [UIImage imageNamed:@"阿狸头像"];
    
    //新图片尺寸
    CGFloat imageW = old.size.width + 2 * borderW;
    CGFloat imageH = old.size.height + 2 * borderW;
    
    
    //开始上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    
    //画大圆
    UIBezierPath *bigPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imageW, imageH)];
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //添加到上下文
    CGContextAddPath(context, bigPath.CGPath);
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    //渲染
    CGContextFillPath(context);
    
    //画圆:正切圆
    UIBezierPath *small = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, old.size.width, old.size.height)];
    //设置裁剪区域
    [small addClip];
    
    //画图片
    [old drawAtPoint:CGPointZero];
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //显示
    UIImageView *view = [[UIImageView alloc] initWithImage:new];
    view.frame = CGRectMake(100, 100, new.size.width, new.size.height);
    [self.view addSubview:view];
    
}
- (void)clipImage {
    //加载旧图片
    UIImage *old = [UIImage imageNamed:@"阿狸头像"];
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(old.size, NO, 0.0);
    
    /*
    //方法1:画一个圆
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, nil, old.size.width / 2, old.size.height / 2, old.size.width / 2, 0, M_PI * 2, NO);
    CGContextRef  con1 = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(con1, path);
    CGContextClip(con1);  //设置裁剪区域
    */
    
     //方法2: 使用贝塞尔路径
    
    //画圆:正切圆
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, old.size.width, old.size.height)];
    //设置裁剪区域
    [path1 addClip];
    
    //画图片
    [old drawAtPoint:CGPointZero];
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //显示
    UIImageView *view = [[UIImageView alloc] initWithImage:new];
    view.frame = CGRectMake(100, 100, new.size.width, new.size.height);
    [self.view addSubview:view];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
