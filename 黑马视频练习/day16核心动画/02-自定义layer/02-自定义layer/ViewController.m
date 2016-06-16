//
//  ViewController.m
//  02-自定义layer
//
//  Created by M-coppco on 16/4/8.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个图层
    CALayer *layer = [CALayer layer];
    
    //设置尺寸
    layer.bounds  = CGRectMake(0, 0, 200, 200);

    //设置位置
    layer.position = CGPointMake(200, 200); //决定锚点在父视图中的位置
    layer.anchorPoint = CGPointMake(0.8, 0.8); //锚点  默认在中心即(0.5,0.5)
    
    //设置颜色
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
