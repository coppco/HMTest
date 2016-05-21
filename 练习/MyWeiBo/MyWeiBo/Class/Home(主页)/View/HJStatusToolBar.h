//
//  HJStatusToolBar.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/21.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJSinaStatus;
@interface HJStatusToolBar : UIView
+ (instancetype)toolBar;
- (void)configButtonWithStatus:(HJSinaStatus *)status;
@end
