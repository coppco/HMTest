//
//  HJTextAttachment.m
//  MyWeiBo
//
//  Created by M-coppco on 16/6/1.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJTextAttachment.h"
#import "HJEmoticon.h"

@implementation HJTextAttachment
- (void)setEmoticon:(HJEmoticon *)emoticon {
    _emoticon = emoticon;
    self.image = [UIImage imageNamed:emoticon.png];
}
@end
