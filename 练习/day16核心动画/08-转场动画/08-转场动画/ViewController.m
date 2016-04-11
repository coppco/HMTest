//
//  ViewController.m
//  08-转场动画
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, assign)NSInteger  i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _i = 1;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _i++;
    if (_i == 4) {
        _i = 1;
    }
    NSString *string = [NSString stringWithFormat:@"%ld", (long)_i];
    _imageV.image = [UIImage imageNamed:string];
    
    //转场动画
    CATransition *transiton = [CATransition animation];
    transiton.type = @"cube";  //立方体效果
    transiton.subtype = kCATransitionMoveIn; //可以控制方向
    transiton.duration = 2;  //持续时间
//    transiton.startProgress = 0.5;  //从那个位置开始
    [_imageV.layer addAnimation:transiton forKey:nil];
}

@end
