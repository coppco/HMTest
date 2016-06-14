//
//  HJEmoticonPopView.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/30.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticonPopView.h"
#import "HJEmoticon.h"

@interface HJEmoticonPopView ()
@property (weak, nonatomic) IBOutlet UIButton *emoticonButton;

@end

@implementation HJEmoticonPopView
+ (instancetype)popView {
    return [[[NSBundle mainBundle] loadNibNamed:@"HJEmoticonPopView" owner:nil options:nil] firstObject];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self iniSubView];
    }
    return self;
}
- (void)awakeFromNib {
    [self iniSubView];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self iniSubView];
    }
    return self;
}
- (void)iniSubView {
    self.emoticonButton.titleLabel.font = [UIFont systemFontOfSize:25];
}
- (void)configEmoticon:(HJEmoticon *)emoticon {
    [self longPressEmoticon:emoticon];
    
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:.25f];
}
- (void)longPressEmoticon:(HJEmoticon *)emoticon {
    if (emoticon.png.length != 0) {
        [self.emoticonButton setImage:[UIImage imageNamed:emoticon.png] forState:(UIControlStateNormal)];
    } else if (emoticon.code != 0) {
        [self.emoticonButton setTitle:[emoticon.code emoji] forState:(UIControlStateNormal)];
    }
}
@end
