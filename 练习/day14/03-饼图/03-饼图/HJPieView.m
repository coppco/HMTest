//
//  HJPieView.m
//  03-饼图
//
//  Created by M-coppco on 16/3/30.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJPieView.h"
#define kRandom (arc4random() % 256 / 255.0)
@implementation HJPieView

- (void)setNumbers:(NSArray<NSNumber *> *)numbers {
    _numbers = numbers;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat total = 0;
    for (NSNumber *num in self.numbers) {
        total += [num integerValue];
    }
    CGFloat begin = 0;
    CGFloat end = 0;
    for (int i = 0; i < _numbers.count; i++) {
        end = begin + ([_numbers[i] integerValue] / total) * M_PI * 2;
    
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:self.frame.size.width / 2 - 5 startAngle:begin endAngle:end clockwise:YES];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [[UIColor colorWithRed:kRandom green:kRandom blue:kRandom alpha:1] setFill];
        [path fill];
         begin  = end;
    }
    CGContextFillPath(context);
}

@end
