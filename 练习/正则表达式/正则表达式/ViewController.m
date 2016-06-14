//
//  ViewController.m
//  正则表达式
//
//  Created by M-coppco on 16/6/7.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  @author M-coppco, 16-06-07 06:06:04
     *
     *  使用正则表达式步骤
     *   1⃣️创建一个正则表达式对象:定义规则
     *   2⃣️利用正则表达式对象来测试相应的字符串
     *
     */
    NSString *text1 = @"abcdef11ghijklmnopqrstuvwxyz10";
    
//    NSString *pattern = @"[0-9]"; //0到9
//    NSString *pattern = @"abc";  //abc
//    NSString *pattern = @"[0123456789]";  //0-9
//    NSString *pattern = @"[a-zA-Z]";  //a-z A-Z
//    NSString *pattern = @"[0-9][0-9]";  //两个连续的数字
    NSString *pattern = @"\\d\\d";  //同2个连续的数字
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *result = [regex matchesInString:text1 options:0 range:NSMakeRange(0, text1.length)];
    [self qq];
    [self phone];
}
- (void)qq {
    NSString *qq = @"01234";
    
    NSString *pattern = @"^[1-9]\\d[4, 10]";
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *array = [regex matchesInString:qq options:0 range:NSMakeRange(0, qq.length)];
//    NSLog(@"%ld", array.count);
}
- (void)phone {
    NSString *phone = @"13733333333";
    NSString *pattern = @"^1[3578]\\d{9}$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *array = [regex matchesInString:phone options:0 range:NSMakeRange(0, phone.length)];
    NSLog(@"%ld", array.count);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
