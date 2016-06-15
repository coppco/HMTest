//
//  ViewController.m
//  06-CAKeyPathAnimation
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:(CGRectMake(0, 0, 200, 200))];
    animation.path = path.CGPath;
    animation.duration = 5;
    [_redView.layer addAnimation:animation forKey:nil];
}
- (void)a111 {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(160, 300)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(300, 150)];
    animation.values = @[v1,v2,v3, v1];
    animation.duration = 5;
    [_redView.layer addAnimation:animation forKey:nil];
}
@end
