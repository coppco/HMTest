//
//  HJTextView.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/23.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJTextView.h"

@interface HJTextView ()
@property (nonatomic, strong)UIImageView  *imageV;
@end
@implementation HJTextView
- (UIImageView *)imageV {
    if (_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self addSubview:_imageV];
    }
    return _imageV;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //通知  文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //如果有文字,不重绘
    if ([self hasText]) {
        return;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = self.font;
    dic[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor grayColor];
    //在矩形里面画,自动换行
    [self.placeholder drawInRect:CGRectMake(10, 8, self.width - 20, self.height - 16) withAttributes:dic];
}
- (void)textDidChanged:(NSNotification *)action {
    [self setNeedsDisplay]; //重绘
}
//占位符文字
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
}
//占位符文字颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}
//解决通过文字修改  不会变化
- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}
//字体
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsDisplay];
}
- (void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image;
    self.imageV.frame = CGRectMake(5, 100, 70, 79);
}
@end
