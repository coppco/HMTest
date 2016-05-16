//
//  UIWindow+HJExtension.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/16.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "UIWindow+HJExtension.h"
#import "HJTabBarController.h"
#import "HJGuideController.h"

@implementation UIWindow (HJExtension)
- (void)switchRootController {
    if ([[HJTool getCFBundleVersonFromNSBundle] isEqualToString:[[NSUserDefaults standardUserDefaults] stringForKey:@"CFBundleVersion"]]) {
        HJTabBarController *tabBarVC = [[HJTabBarController alloc] init];
        self.rootViewController = tabBarVC;
    } else {
        HJGuideController *guideVC = [[HJGuideController alloc] init];
        self.rootViewController = guideVC;
    }
}
@end
