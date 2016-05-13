//
//  HJTabBar.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/1.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJTabBar : UITabBar

//点击button的block
@property (nonatomic, copy)void (^click)();

@end
