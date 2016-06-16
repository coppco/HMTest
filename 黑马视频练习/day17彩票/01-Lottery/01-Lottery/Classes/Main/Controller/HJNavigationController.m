//
//  HJNavigationController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/13.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJNavigationController.h"

@interface HJNavigationController ()

@end

@implementation HJNavigationController

/**
 *  第一次使用这个类或者子类的时候调用
 */
+ (void)initialize {
//    //获取所有导航条外观
//    UINavigationBar *bar = [UINavigationBar appearance];
//    //统一设置
//    [bar setBarTintColor:[UIColor redColor]];//背景颜色
//    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}]; //文字样式
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];  //设置导航栏
    // Do any additional setup after loading the view.
}

- (void)setNav {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获取所有导航条外观
        UINavigationBar *bar = [UINavigationBar appearance];
        //统一设置
        [bar setBarTintColor:[UIColor redColor]];//导航栏背景颜色
        [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}]; //文字样式
        [bar setTintColor:[UIColor whiteColor]]; //设置导航栏按钮颜色
        
//        //统一设置导航栏上面的barbuttonitem样式
//        UIBarButtonItem *barButtomItem = [UIBarButtonItem appearance];
//        //背景图片
//        [barButtomItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];
//        [barButtomItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed "] forState:(UIControlStateHighlighted) barMetrics:(UIBarMetricsDefault)];
//        //返回图片
//        [barButtomItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];
//        [barButtomItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:(UIControlStateHighlighted) barMetrics:(UIBarMetricsDefault)];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
