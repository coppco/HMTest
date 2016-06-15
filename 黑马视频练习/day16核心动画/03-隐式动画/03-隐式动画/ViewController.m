//
//  ViewController.m
//  03-隐式动画
//
//  Created by M-coppco on 16/4/8.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     只有自己创建的CALayer才有隐式动画,它的属性带有Animatable 即可实现隐式动画
     */
    _layer = [CALayer layer];
    _layer.position = CGPointMake(50, 50);
    _layer.bounds = CGRectMake(100, 100, 100, 100);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.anchorPoint = CGPointZero;
    _layer.cornerRadius = 50;
    
    [self.view.layer addSublayer:_layer];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //直接这样写即可实现隐式动画
    _layer.position = CGPointMake(150, 300);
    
    /*
     //关闭隐世动画
    [CATransaction begin]; //开启事务
    [CATransaction setDisableActions:YES];
    _layer.position = CGPointMake(150, 300);
    [CATransaction commit];
     */
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
