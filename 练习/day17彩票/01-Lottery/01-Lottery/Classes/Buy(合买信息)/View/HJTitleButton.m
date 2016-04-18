//
//  HJTitleButton.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/13.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJTitleButton.h"
#import <Availability.h>
@implementation HJTitleButton

- (void)awakeFromNib {
    self.imageView.contentMode = UIViewContentModeCenter;
}
#ifdef __IPHONE_7_0
#else
#endif
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = 30;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
