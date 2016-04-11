//
//  HJTabBarController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJTabBarController.h"
#import "HJTabBar.h"
@interface HJTabBarController ()

@end

@implementation HJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HJTabBar *tabBar = [[HJTabBar alloc] init];
    tabBar.frame = self.tabBar.frame;
    [tabBar setClickBlock:^(NSInteger index) {
        self.selectedIndex = index;
    }];
    
    NSString *image = nil;
    NSString *selectImage = nil;
    for (int i = 0; i < 5; i++) {
        selectImage = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        image = [NSString stringWithFormat:@"TabBar%d", i + 1];
        [tabBar addTabBarButtonWithNormalBGImage:image selectBGImage:selectImage];
    }
    
    [self.view addSubview:tabBar];
    [self.tabBar removeFromSuperview];
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
