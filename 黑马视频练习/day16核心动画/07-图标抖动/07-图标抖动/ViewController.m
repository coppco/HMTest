//
//  ViewController.m
//  07-图标抖动
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imageV addGestureRecognizer:longPress];
}
- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        //添加动画
        CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        CGFloat centerX = _imageV.center.x;
        NSNumber *n1 = [NSNumber numberWithFloat:centerX - 10];
        NSNumber *n2 = [NSNumber numberWithFloat:centerX];
        NSNumber *n3 = [NSNumber numberWithFloat:centerX + 10];
        key.values = @[n1, n2, n3,n1, n2, n3,n1, n2, n3];
        key.duration = 1;
        [_imageV.layer addAnimation:key forKey:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
