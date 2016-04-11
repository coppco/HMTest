//
//  HJWheelView.m
//  10-转盘
//
//  Created by M-coppco on 16/4/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJWheelView.h"
#define angle2Radian(x) ((x) / 180.0 * M_PI)
#import "HJWheelButton.h"

@interface HJWheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *rotationView;
@property (nonatomic, strong)UIButton  *selectButton;
@property (nonatomic, strong)CADisplayLink  *link;
@end

@implementation HJWheelView

+ (instancetype)wheelView {
    return [[[NSBundle mainBundle] loadNibNamed:@"HJWheelView" owner:nil options:nil] firstObject];
}

//从xib加载视图初始化方法,但是脱线的属性还没有值,在awakeFromNib方法里面才有值
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        NSLog(@"initWithCoder:%@", _rotationView);
    }
    return self;
}
- (void)awakeFromNib {
//    NSLog(@"awakeFromNib:%@", _rotationView);
    [self addButtons];
}
- (void)addButtons {
    //裁剪图片---原始图片正常状态
    UIImage *image = [UIImage imageNamed:@"LuckyAstrology"];
    //裁剪图片---选中图片
    UIImage *selectImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    //对应的缩放比
    CGFloat scale = [UIScreen mainScreen].scale;
    
    CGFloat imageW = scale * image.size.width / 12 ;
    CGFloat imageH = scale *image.size.height ;
    NSLog(@"%f===%f", imageW, imageH);
    
    for (int i = 0; i < 12; i++) {
        //创建button
        HJWheelButton *button = [HJWheelButton buttonWithType:(UIButtonTypeCustom)];
        button.layer.anchorPoint = CGPointMake(0.5, 1); //设置锚点
        button.layer.position = CGPointMake(self.bounds.size.width *0.5, self.bounds.size.height * 0.5); //位置
        button.bounds = CGRectMake(0, 0, 68, 143);//大小
        //旋转
        button.layer.transform = CATransform3DMakeRotation(angle2Radian(i * 30), 0, 0, 1);
        //选中背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:(UIControlStateSelected)];
        
        //裁剪图片
        CGImageRef small = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(i * imageW, 0, imageW, imageH));
        
        CGImageRef smallSelect = CGImageCreateWithImageInRect(selectImage.CGImage, CGRectMake(i * imageW, 0, imageW, imageH));
        
        [button setImage:[UIImage imageWithCGImage:small] forState:(UIControlStateNormal)];
        [button setImage:[UIImage imageWithCGImage:smallSelect] forState:(UIControlStateSelected)];
        [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchDown)];
        
        if (0 == i) {
            [self click:button];
        }
        
        [_rotationView addSubview:button];
    }
}
- (void)click:(UIButton *)button {
    _selectButton.selected = NO;
    button.selected = YES;
    _selectButton = button;
}
- (void)startRotating {
    /*
     //这样可以旋转,但是旋转的时候,选择有问题
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.toValue = @(M_PI * 2);
    animation.repeatCount = MAXFLOAT;
    animation.duration = 5;
    [_rotationView.layer addAnimation:animation forKey:nil];
     */
    self.link.paused = NO;
}
- (void)update {
    _rotationView.transform = CGAffineTransformRotate(_rotationView.transform, angle2Radian(45 / 60.0));
}
- (void)stopRotating {
    self.link.paused = YES;
}
- (CADisplayLink *)link {
    if (_link == nil) {
        _link =[CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}
- (IBAction)quick:(UIButton *)sender {
    //关闭用户交互
    _rotationView.userInteractionEnabled = NO;
    //取消慢慢旋转
    [self stopRotating];
    //快速旋转
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.toValue = @(M_PI * 2 * 3);
//    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5;
    animation.delegate = self;
    [_rotationView.layer addAnimation:animation forKey:nil];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    _rotationView.userInteractionEnabled = YES;
    //让旋转按钮回到最上面
    //获取旋转的角度
    CGFloat angle = atan2(_selectButton.transform.b, _selectButton.transform.a);
    _rotationView.transform = CGAffineTransformMakeRotation(-angle);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}
@end
