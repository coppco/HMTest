//
//  HJNavigationController.m
//  MyWeiBo
//
//  Created by M-coppco on 16/4/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJNavigationController.h"

@interface HJNavigationController ()

@end

@implementation HJNavigationController
/**
 *  第一次使用这个类或者子类的时候调用
 */
+ (void)initialize {
    //设置导航栏的统一样式
    UIBarButtonItem *barButtom = [UIBarButtonItem appearance];
    //导航栏上面的字体
    [barButtom setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor], NSFontAttributeName : [UIFont systemFontOfSize:16]} forState:(UIControlStateNormal)];
    [barButtom setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:(UIControlStateDisabled)];
    
    //设置导航栏的背景颜色
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.barTintColor = ColorFromString(@"##c8db8c");
}

/**
 *  重写push方法,push进去的控制器都会设置一下样式
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //不要忘记重写父类方法
    [super pushViewController:viewController animated:animated];
    //判断是不是根控制器的时候才设置统一样式
    if (self.viewControllers.count > 1) {
        /*设置左右按钮*/
        [self setNavigationItemWith:viewController];
        
        /*设置tabbar隐藏*/
        viewController.hidesBottomBarWhenPushed = YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
/*设置左右按钮*/
- (void)setNavigationItemWith:(UIViewController *)viewController {
    
    //左边
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(back) mage:@"navigationbar_back" hightlighted:@"navigationbar_back_highlighted"];
    
    //右边
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(home) mage:@"navigationbar_more" hightlighted:@"navigationbar_more_highlighted"];
}
/*返回上一个控制器*/
- (void)back {
    [self popViewControllerAnimated:YES];
}
/*返回主页*/
- (void)home {
    [self popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
