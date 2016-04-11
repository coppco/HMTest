//
//  ViewController.m
//  01
//
//  Created by M-coppco on 15/11/25.
//  Copyright © 2015年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *hehe;
@property (weak, nonatomic) IBOutlet UILabel *dddd;

@property (nonatomic, strong)NSString *aaaa;

@property (nonatomic, strong)NSString *a1;
@property (nonatomic, strong)NSString *a2;
@property (nonatomic, strong)NSString *a3;
@property (nonatomic, strong)NSString *a4;
@end

@implementation ViewController
- (IBAction)compute:(UIButton *)sender {
    NSLog(@"111");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
