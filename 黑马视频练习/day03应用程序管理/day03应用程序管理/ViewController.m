//
//  ViewController.m
//  day03应用程序管理
//
//  Created by M-coppco on 15/12/29.
//  Copyright © 2015年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "Info.h"
#import "AppView.h"

@interface ViewController ()<AppViewDelegate>
@property (nonatomic, strong)NSArray *plistArray;
@property (nonatomic, strong)UILabel *label;
@end

@implementation ViewController
-(NSArray *)plistArray {
    if (_plistArray == nil) {
        _plistArray = [Info appList];
    }
    return _plistArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //搭建界面,九宫格
    for (int i = 0 ; i < 12; i++) {
        int row = i % 3;
        int lie = i / 3;
        Info *info = self.plistArray[i];
        
        //xib加载
        //AppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] firstObject];
        //appView.info = info;
        AppView *appView = [AppView appViewWithInfo:info];
        appView.frame = CGRectMake(20 + 130 * row, 30 + 170 * lie, ViewW(appView), ViewH(appView));
        appView.delegate = self;
        [self.view addSubview:appView];
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20 + 130 * row, 30 + 170 * lie, 110, 160)];
//        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
//        imageV.image = info.image;
//        //图像的填充模式
//        imageV.contentMode = UIViewContentModeScaleAspectFit;
//        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 120, 20)];
//        name.textAlignment = NSTextAlignmentCenter;
//        name.text = info.name;
//        UIButton *download = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        download.tag = i;
//        download.frame = CGRectMake(0, CGRectGetMaxY(name.frame), 120, 20);
//        [download setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:(UIControlStateNormal)];
//        [download setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:(UIControlStateHighlighted)];
//        [download setTitle:@"下载" forState:(UIControlStateNormal)];
//        [download addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
//        [view addSubview:download];
//        [view addSubview:imageV];
//        [view addSubview:name];
//        [self.view addSubview:view];
    }
    
}
- (void)appViewButtonShouldClick:(Info *)info {
    [self.label removeFromSuperview];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, ViewH(self.view) / 8 * 7, ViewW(self.view), 30)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = info.name;
    self.label.alpha = 0;
    self.label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [self.view addSubview:self.label];
    [UIView animateWithDuration:1 animations:^{
        self.label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.label.alpha = 0;
        } completion:^(BOOL finished) {
            [self.label removeFromSuperview];
            
        }];
    }];

}
//- (void)click:(UIButton *)button {
//    [self.label removeFromSuperview];
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, ViewH(self.view) / 8 * 7, ViewW(self.view), 30)];
//    self.label.textAlignment = NSTextAlignmentCenter;
//    self.label.text = ((Info *)self.plistArray[button.tag]).name;
//    self.label.alpha = 0;
//    self.label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
//    [self.view addSubview:self.label];
//    [UIView animateWithDuration:1 animations:^{
//        self.label.alpha = 1;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1 animations:^{
//           self.label.alpha = 0;
//        } completion:^(BOOL finished) {
//            [self.label removeFromSuperview];
//        }];
//    }];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
