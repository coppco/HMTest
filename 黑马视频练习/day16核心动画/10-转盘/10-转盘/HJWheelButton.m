//
//  HJWheelButton.m
//  10-转盘
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJWheelButton.h"

@implementation HJWheelButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.size.width / 2 - 20, 20, 40, 47);
}
- (void)setHighlighted:(BOOL)highlighted {}
@end
