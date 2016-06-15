//
//  HJTitleButton.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/17.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJTitleButton.h"

@implementation HJTitleButton
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
//        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.x = self.imageView.x;
    self.imageView.x = self.titleLabel.right + 10;
}
- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}
//目的:想在系统算好尺寸之后再修改尺寸
- (void)setFrame:(CGRect)frame {
    frame.size.width += 10;
    [super setFrame:frame];
}
@end
