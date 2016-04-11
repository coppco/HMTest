//
//  ViewController.m
//  10-转盘
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJWheelView.h"
@interface ViewController ()
@property (nonatomic, strong)HJWheelView *wheelView;
@end

@implementation ViewController
- (IBAction)start:(UIBarButtonItem *)sender {
    [_wheelView startRotating];
}
- (IBAction)stop:(UIBarButtonItem *)sender {
    [_wheelView stopRotating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _wheelView = [HJWheelView wheelView];
    _wheelView.center = self.view.center;
    [self.view addSubview:_wheelView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
