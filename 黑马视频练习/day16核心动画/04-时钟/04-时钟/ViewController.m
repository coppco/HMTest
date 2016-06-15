//
//  ViewController.m
//  04-时钟
//
//  Created by M-coppco on 16/4/8.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

#define angleToRadian(x) ((x) / 180 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@property (nonatomic, strong)CALayer *second;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSecond];  //添加秒针
}

//添加秒针
- (void)addSecond {
    _second = [CALayer layer];
    _second.anchorPoint = CGPointMake(0.5, 1);
    _second.position = CGPointMake(_clockView.bounds.size.width / 2, _clockView.bounds.size.height / 2);
    _second.bounds = CGRectMake(0, 0, 1.8, _clockView.frame.size.height / 2 - 15);
    _second.backgroundColor = [UIColor redColor].CGColor;
    [_clockView.layer addSublayer:_second];
    
    [self updateTimer:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

- (void)updateTimer:(NSTimer *)timer {
    //获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取日期组件
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond fromDate:[NSDate date]];
    //获取秒数
    CGFloat sec = components.second;
    _second.transform = CATransform3DMakeRotation(angleToRadian(sec *6), 0, 0, 1);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
