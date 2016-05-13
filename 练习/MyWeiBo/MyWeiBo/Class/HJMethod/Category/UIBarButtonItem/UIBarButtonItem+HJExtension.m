//
//  UIBarButtonItem+HJExtension.m
//  MyWeiBo
//
//  Created by M-coppco on 16/4/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "UIBarButtonItem+HJExtension.h"

@implementation UIBarButtonItem (HJExtension)
+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target action:(SEL)action mage:(NSString *)image hightlighted:(NSString *)hightlighted {
    UIButton *backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backButton setBackgroundImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [backButton setBackgroundImage:[UIImage imageNamed:hightlighted] forState:(UIControlStateHighlighted)];
    backButton.size = CGSizeMake(40, 40);
    [backButton addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}
@end
