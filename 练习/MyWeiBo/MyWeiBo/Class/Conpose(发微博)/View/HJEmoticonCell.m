//
//  HJEmoticonCell.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticonCell.h"
#import "HJEmoticon.h"
@interface HJEmoticonCell ()
/**图片*/
@property (nonatomic, strong)UIImageView  *imageV;
/**文字*/
@property (nonatomic, strong)UILabel  *emoji;
@end

@implementation HJEmoticonCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc] init];
        self.imageV.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageV];
        self.emoji = [[UILabel alloc] init];
        self.emoji.textAlignment = 1;
        self.emoji.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.emoji];
    }
    return self;
}
- (void)setEmoticon:(HJEmoticon *)emoticon {
    _emoticon = emoticon;
    
    if (emoticon.png.length != 0) {
        self.emoji.hidden = YES;
        self.imageV.hidden = NO;
        self.imageV.image = [UIImage imageNamed:emoticon.png];
    } else {
        self.emoji.hidden = NO;
        self.imageV.hidden = YES;
        self.emoji.text = [emoticon.code emoji];
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageV.size = CGSizeMake(self.width * 0.8, self.height * 0.8);

    self.imageV.center = self.contentView.center;
    
    self.emoji.size = CGSizeMake(self.width, self.height);

    self.emoji.center = self.contentView.center;
}
@end
