//
//  ViewController.m
//  5-06___runtime 关联属性
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HJEntension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *object = [[NSObject alloc] init];
    object.name = @"大大大";
    NSLog(@"%@", object.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
