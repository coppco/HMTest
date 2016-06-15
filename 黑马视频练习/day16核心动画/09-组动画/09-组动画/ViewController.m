//
//  ViewController.m
//  09-组动画
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //旋转
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.toValue = @M_PI_2;
    
    //缩放
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    rotation.toValue = @0.5;
    
    //位移
//    CABasicAnimation *position = [CABasicAnimation animation];
//    position.keyPath = @"position";
//    rotation.toValue = [NSValue valueWithCGPoint:CGPointMake(10, 400)];
    
    
    
    //组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotation,scale];
    group.duration = 2;
    [_redView.layer addAnimation:group forKey:nil];
}

@end
