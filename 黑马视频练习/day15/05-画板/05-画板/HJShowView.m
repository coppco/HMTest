//
//  HJShowView.m
//  05-画板
//
//  Created by M-coppco on 16/4/7.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJShowView.h"

@interface HJShowView ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIImageView  *imageV;
@end

@implementation HJShowView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addImageView];
        [self addGestureRecognizers];
    }
    return self;
}

//添加手势
- (void)addGestureRecognizers {
    //长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imageV addGestureRecognizer:longPress];
    
    //旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.imageV addGestureRecognizer:rotation];
    
    //捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.imageV addGestureRecognizer:pinch];
}
//长按
- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    [UIView animateWithDuration:0.3 animations:^{
        self.imageV.alpha = 0.2;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.imageV.alpha = 1;
        } completion:^(BOOL finished) {
            //截屏
            UIImage *image = [self quickImage];
            //把图片传到控制器
            if (self.imageBlock) {
                self.imageBlock(image);
            }
            //从父视图移除
            [self removeFromSuperview];
        }];
    }];
}
//旋转
- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, rotation.rotation);
    rotation.rotation = 0;
}
//捏合
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image;
}
- (void)addImageView {
    self.imageV = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageV.userInteractionEnabled = YES;
    [self addSubview:self.imageV];
}
//截屏
- (UIImage *)quickImage {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //渲染到上下文
    [self.layer renderInContext:context];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
