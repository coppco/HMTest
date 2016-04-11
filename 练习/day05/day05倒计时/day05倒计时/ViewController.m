//
//  ViewController.m
//  day05倒计时
//
//  Created by M-coppco on 16/3/1.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (nonatomic, strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //最后一种定时器 有一个bug   多次点击开始  会有bug
}
- (IBAction)play:(UIBarButtonItem *)sender {
    /**---------------------方法1--------------------*/
    //使用scheduledTimerWithTimeInterval创建  滑动的时候不执行监听方法
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun:) userInfo:@"1" repeats:YES];
     /**---------------------方法2--------------------*/
    //使用timerWithTimeInterval创建需要手动添加到运行循环中
    //NSDefaultRunLoopMode  这个模式和方法1一样
//    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    /**---------------------方法3--------------------*/
    //使用timerWithTimeInterval创建需要手动添加到运行循环中
    //NSDefaultRunLoopMode  这个模式和方法1一样
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (IBAction)pause:(UIBarButtonItem *)sender {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)timerRun:(NSTimer *)timer{
    //取文字
    int title = self.title1.text.intValue;
    
    if (--title < 0) {
        [self pause:nil];
    } else {
        //更新UI
        self.title1.text = [NSString stringWithFormat:@"%d", title];
    }
}
- (IBAction)fuhui:(id)sender {
    self.title1.text = @"10";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
