//
//  ViewController.m
//  03-屏幕截屏
//
//  Created by M-coppco on 16/4/5.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //渲染控制器view的图层到上下文
    //图层只能用渲染不能使用draw
    [self.view.layer renderInContext:context];
    
    //获取截屏图片
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    self.imageV.image = new;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
