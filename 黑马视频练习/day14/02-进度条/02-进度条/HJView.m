//
//  HJView.m
//  02-进度条
//
//  Created by M-coppco on 16/3/30.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJView.h"

@interface HJView ()
@property (nonatomic, copy)NSString *text;
@end

@implementation HJView

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if (_progress >= 1.0f) {
        _text = @"下载完成";
    } else {
        _text = [NSString stringWithFormat:@"%.2f%%", progress * 100];
    }
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    [_text drawInRect:CGRectMake(0, self.frame.size.height / 2 - 15, self.frame.size.width, 30) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:[UIColor blueColor], NSParagraphStyleAttributeName:paragraph}];
    
    //路径
    CGContextAddArc(context, self.frame.size.width / 2, self.frame.size.height / 2, self.frame.size.width / 2 - 5, 0, M_PI * 2 * _progress, NO);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetLineWidth(context, 5);
    CGContextStrokePath(context);
}
@end
