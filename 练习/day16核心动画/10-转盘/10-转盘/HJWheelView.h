//
//  HJWheelView.h
//  10-转盘
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJWheelView : UIView
//从xib加载
+ (instancetype)wheelView;

- (void)startRotating;

- (void)stopRotating;
@end
