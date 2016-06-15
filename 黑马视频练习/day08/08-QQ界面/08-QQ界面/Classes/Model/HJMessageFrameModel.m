//
//  HJMessageFrameModel.m
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJMessageFrameModel.h"
#import "HJMessageModel.h"
@implementation HJMessageFrameModel
- (void)setMessage:(HJMessageModel *)message {
    _message = message;
    //1. 时间
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = bScreenWidth;
    CGFloat timeH = bNormalH;
    
    _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    
    CGFloat padding = 10;
    
    //2. 头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconW = bIconW;
    CGFloat iconH = bIconW;
    
    
    if (_message.type == HJMessageTypeJobs) {
        iconX = padding;
    } else {
        iconX = bScreenWidth - 10 - iconW;
    }
    _timeF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //正文
    CGFloat textX;
    CGFloat textY = iconY;
    CGRect bounds = [_message.text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:bBtnFont} context:nil];
    if (_message.type == HJMessageTypeJobs) {
        textX = padding + iconW + 20;
    } else {
        textX = bScreenWidth - 10 - iconW - 20 - 200;
    }
    _textF = CGRectMake(textX, textY, bounds.size.width, bounds.size.height);
    
    //cell高度
    _cellH = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_textF));
}
@end
