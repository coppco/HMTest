 //
//  HJTabBarController.m
//  MyWeiBo
//
//  Created by coco on 16/4/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJTabBarController.h"
#import "HJMyViewController.h"  //我的
#import "HJHomeViewController.h"  //主页
#import "HJMessageViewController.h"  //消息
#import "HJDiscoverViewController.h"  //发现
#import "HJNavigationController.h"
#import "HJTabBar.h"
#import "HJComposeController.h"  //发微博
@interface HJTabBarController ()

@end

@implementation HJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self addChildVC:[[HJHomeViewController alloc] init] title:NSLocalizedString(@"首页", nil)  image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
     [self addChildVC:[[HJMessageViewController alloc] init] title:NSLocalizedString(@"消息", nil)  image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [self addChildVC:[[HJDiscoverViewController alloc] init] title:NSLocalizedString(@"发现", nil) image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [self addChildVC:[[HJMyViewController alloc] init] title:NSLocalizedString(@"我的", nil) image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    //利用KVC  使用自定义类
    HJTabBar *tabBar = [[HJTabBar alloc] init];
    [tabBar setClick:^{
        HJComposeController *Compose = [[HJComposeController alloc] init];
        HJNavigationController *navi = [[HJNavigationController alloc] initWithRootViewController:Compose];
        [self presentViewController:navi animated:YES completion:nil];
    }];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    
}

/**
 *  @author XHJ, 16-04-29 15:04:04
 *
 *  设置控制器属性,添加到tabbarcontroller中
 *
 *  @param childVC       子控制器
 *  @param title         标题
 *  @param image         正常图片
 *  @param selectedImage 选中图片
 */
- (void)addChildVC:(UIViewController *)childVC
             title:(NSString *)title image:(NSString *)image
             selectedImage:(NSString *)selectedImage {
    /*
     //同下面的一句
    childVC.tabBarItem.title = title;
    childVC.navigationItem.title = title;
     */
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]; //原始图片
    
    //设置tabbar文字样式
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.orangeColor} forState:(UIControlStateSelected)];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.blackColor} forState:(UIControlStateNormal)];
    
    //添加导航栏
    HJNavigationController *navi = [[HJNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:navi];
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
