//
//  HJComposeTool.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/24.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJComposeTool.h"
typedef enum {
    HJComposeButtonTypeCamera,  //相机
    HJComposeButtonTypePicture,  //照片
    HJComposeButtonTypeMention,  //@
    HJComposeButtonTypeTrend,  // #
    HJComposeButtonTypeEmoticon  //表情
}HJComposeButtonType;

@interface HJComposeTool ()

@end
@implementation HJComposeTool

+ (instancetype)toolbar {
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        [self setupBtn:@"compose_camerabutton_background" hight:@"compose_camerabutton_background_highlighted" tag:(HJComposeButtonTypeCamera)];
        
        [self setupBtn:@"compose_toolbar_picture" hight:@"compose_toolbar_picture_highlighted" tag:(HJComposeButtonTypePicture)];
        
        [self setupBtn:@"compose_mentionbutton_background" hight:@"compose_mentionbutton_background_highlighted" tag:(HJComposeButtonTypeMention)];
        
        [self setupBtn:@"compose_trendbutton_background" hight:@"compose_trendbutton_background_highlighted" tag:(HJComposeButtonTypeTrend)];
        
        [self setupBtn:@"compose_emoticonbutton_background" hight:@"compose_emoticonbutton_background_highlighted" tag:(HJComposeButtonTypeEmoticon)];
//        [self setupBtn:@"compose_keyboardbutton_background" hight:@"compose_keyboardbutton_background_highlighted"];
        
    }
    return self;
}
- (void)setupBtn:(NSString *)normal hight:(NSString *)highlighted tag:(HJComposeButtonType)type{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:normal] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:highlighted] forState:(UIControlStateHighlighted)];
    button.tag = type;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:button];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    for (NSUInteger i = 0; i < self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake(i * self.width / self.subviews.count, 0, self.width / self.subviews.count, self.height);
    }
}
- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        case HJComposeButtonTypeCamera:
        {
            if (self.cameraButtonHasClicked) {
                self.cameraButtonHasClicked(self, button);
            }
        }
            break;
        case HJComposeButtonTypeMention:
        {
            if (self.mentionButtonHasClicked) {
                self.mentionButtonHasClicked(self, button);
            }
        }
            break;
        case HJComposeButtonTypeEmoticon:
        {
            if (self.emoticonButtonHasClicked) {
                self.emoticonButtonHasClicked(self, button);
            }
        }
            break;
        case HJComposeButtonTypePicture:
        {
            if (self.pictureButtonHasClicked) {
                self.pictureButtonHasClicked(self, button);
            }
        }
            break;
        case HJComposeButtonTypeTrend:
        {
            if (self.trendButtonHasClicked) {
                self.trendButtonHasClicked(self, button);
            }
        }
            break;
        default:
            break;
    }
}
@end
