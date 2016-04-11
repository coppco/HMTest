//
//  ViewController.m
//  05-CABasicAnimation
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = CGPointMake(100, 100);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self position];  //改变position
    [self transformX];  //旋转
}
- (void)position {
    //创建动画
    CABasicAnimation *basic = [CABasicAnimation animation];
    //设置动画属性
    basic.keyPath = @"position"; //
    //设置终点值
    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    
    //设置动画持续时间
    basic.duration = 3;
    
    //是否移除动画在结束之后
    basic.removedOnCompletion = NO;
    
    //保持最新的位置
    basic.fillMode = kCAFillModeForwards;
    //layer添加动画
    [_layer addAnimation:basic forKey:nil];
}
- (void)transformX {
    //创建动画
    CABasicAnimation *basic = [CABasicAnimation animation];
    //设置动画属性
    basic.keyPath = @"transform";
    //设置终点值
    basic.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 1)];
    
    //设置动画持续时间
    basic.duration = 0.6;
    
    //是否移除动画在结束之后
    basic.removedOnCompletion = NO;
    
    //保持最新的位置
    basic.fillMode = kCAFillModeForwards;
    
    //动画的执行次数
    basic.repeatCount = MAXFLOAT;
    //layer添加动画
    [_layer addAnimation:basic forKey:nil];
}
@end
