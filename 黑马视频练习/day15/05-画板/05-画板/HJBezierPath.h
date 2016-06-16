//
//  HJBezierPath.h
//  05-画板
//
//  Created by M-coppco on 16/4/6.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJBezierPath : UIBezierPath
@property (nonatomic, strong)UIColor *color;
+ (instancetype)bezierPathWithLineWidth:(CGFloat)width color:(UIColor *)color startPoint:(CGPoint)point;
@end
