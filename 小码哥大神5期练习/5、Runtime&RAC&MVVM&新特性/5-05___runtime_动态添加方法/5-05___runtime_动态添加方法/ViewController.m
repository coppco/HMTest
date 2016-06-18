//
//  ViewController.m
//  5-05___runtime_动态添加方法
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [[Person alloc] init];
    
    //使用performSelector时候,执行没有实现的方法,会调用类的resolve....方法, 不实现这个方法,就会异常
    [person performSelector:@selector(eat)];
    
    [person performSelector:@selector(eat:) withObject:@"food"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
