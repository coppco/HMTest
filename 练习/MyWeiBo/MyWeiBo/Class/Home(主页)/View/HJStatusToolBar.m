//
//  HJStatusToolBar.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/21.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJStatusToolBar.h"
#import "HJSinaStatus.h"
@interface HJStatusToolBar ()
@property (nonatomic, strong)UIButton  *attitudesB; //表态
@property (nonatomic, strong)UIButton  *repostsB; //转发
@property (nonatomic, strong)UIButton  *commentsB; //评论
@end

@implementation HJStatusToolBar
+ (instancetype)toolBar {
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame {
   self =  [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.attitudesB = [self setButtonWithTitle:@"赞" image:@"timeline_icon_unlike"];
        
        self.repostsB = [self setButtonWithTitle:@"转发" image:@"timeline_icon_retweet"];
        
        self.commentsB = [self setButtonWithTitle:@"评论" image:@"timeline_icon_comment"];
    }
    return self;
}
- (UIButton *)setButtonWithTitle:(NSString *)title image:(NSString *)image {
    return ({
             UIButton *butotn = [UIButton buttonWithType:(UIButtonTypeCustom)];
             [butotn setTitle:title forState:(UIControlStateNormal)];
            [butotn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        butotn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
            butotn.titleLabel.font = [UIFont systemFontOfSize:14];
             [butotn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
            [self addSubview:butotn];
             butotn;
    });
}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    for (int i = 0; i < count; i++) {
        UIButton *button = self.subviews[i];
        button.y = 0;
        button.width = btnW;
        button.height = btnH;
        button.x = i * btnW;
    }
}
- (void)configButtonWithStatus:(HJSinaStatus *)status {
    //转发
    [self.repostsB setTitle:[status.reposts_count isEqualToString:@"0"] ? @"转发" : status.reposts_count  forState:(UIControlStateNormal)];
    //赞
    [self.attitudesB setTitle:[status.attitudes_count isEqualToString:@"0"] ? @"赞" : status.attitudes_count  forState:(UIControlStateNormal)];
    //评论
    [self.commentsB setTitle:[status.comments_count isEqualToString:@"0"] ? @"评论" : status.comments_count  forState:(UIControlStateNormal)];
}
@end
