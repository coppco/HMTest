//
//  ViewController.m
//  函数编程思想的计算器
//
//  Created by coco on 16/7/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "ViewController.h"
#import "Calculation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Calculation *calculation = [[Calculation alloc] init];
    float result = [calculation Calculation:^float(float result) {
        result += 10;
        result -= 4;
        result *= 2.1;
        result /= 3;
        return result;
    }].result;
    NSLog(@"%f", result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
