//
//  HJEmoticonBottom.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/28.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticonBottom.h"
#import "HJRemoveButton.h"

@interface HJEmoticonBottom ()
/**选中button*/
@property (nonatomic, strong)UIButton  *selectButton;
@end

@implementation HJEmoticonBottom

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configButtons];
    }
    return self;
}
- (void)configButtons {
    NSArray *titleArray = @[
                            NSLocalizedString(@"最近", nil),
                            NSLocalizedString(@"默认", nil),
                            NSLocalizedString(@"Emoji", nil),
                            NSLocalizedString(@"浪小花", nil)
                            ];
    for (int i = 0; i < titleArray.count; i++) {
        HJRemoveButton *button = [HJRemoveButton buttonWithType:(UIButtonTypeCustom)];
        [button setTitle:titleArray[i] forState:(UIControlStateNormal)];
        [self addSubview:button];
        button.tag = i;
        button.adjustsImageWhenHighlighted = NO;//取消长按的时候黑色背景
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchDown)];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor grayColor] forState:(UIControlStateSelected)];
        if (0 == i) {
            [button setBackgroundImage:[self resizeImage:@"compose_emotion_table_left_normal"] forState:(UIControlStateNormal)];
            [button setBackgroundImage:[self resizeImage:@"compose_emotion_table_left_selected"] forState:(UIControlStateSelected)];
        } else if (3 == i) {
            [button setBackgroundImage:[self resizeImage:@"compose_emotion_table_right_normal"] forState:(UIControlStateNormal)];
            [button setBackgroundImage:[self resizeImage:@"compose_emotion_table_right_selected"] forState:(UIControlStateSelected)];
        } else {
            [button setBackgroundImage:[self resizeImage:@"compose_emotion_table_mid_normal"] forState:(UIControlStateNormal)];
            [button setBackgroundImage:[self resizeImage:@"compose_emotion_table_mid_selected"] forState:(UIControlStateSelected)];
        }
    }
}
- (void)buttonClick:(UIButton *)button {
    if (self.selectButton == button) {
        return;
    }
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;

    if (self.buttonClick) {
        self.buttonClick(button.tag);
    }
}
- (UIImage *)resizeImage:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *view = (UIButton *)self.subviews[i];
        view.frame = CGRectMake(i * self.width / self.subviews.count, 0, self.width / self.subviews.count, self.height);
        if (view.tag == HJEmoticonBottomTypeDefault ) {
            [self buttonClick:view];
        }
    }
}
@end
