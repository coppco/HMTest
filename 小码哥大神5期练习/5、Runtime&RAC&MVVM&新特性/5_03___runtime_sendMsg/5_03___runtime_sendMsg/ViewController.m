//
//  ViewController.m
//  5_03___runtime_sendMsg
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //消息发送机制:
    //1⃣️导入#import <objc/message.h>
    //2⃣️需要搜索  objc_msgSend  把YES  改为 NO
    //3⃣️objc_msgSend(<#id self#>, <#SEL op, ...#>)方法
    objc_msgSend(self.view, @selector(setBackgroundColor:), [UIColor redColor]);

    Person *person = [[Person alloc] init];
    objc_msgSend(person, @selector(eat:), @"米饭");
    
    objc_msgSend([person class], @selector(eat:), @"猪");
    
    //对象      方法    参数(可以有多个或者0个,根据方法中的参数)
    objc_msgSend([Person class], @selector(eat:), @"菜");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
