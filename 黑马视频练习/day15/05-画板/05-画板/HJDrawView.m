//
//  HJDrawView.m
//  05-画板
//
//  Created by M-coppco on 16/4/6.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJDrawView.h"
#import "HJBezierPath.h"

@interface HJDrawView ()
@property (nonatomic, strong)UIBezierPath  *path;//路径
@property (nonatomic, strong)NSMutableArray *paths;  //存放路径的数组
@end

@implementation HJDrawView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _lineWidth = 2;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _lineWidth = 2;
    }
    return self;
}
- (NSMutableArray *)paths {
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}
//绘制
- (void)drawRect:(CGRect)rect {
    if (!self.paths.count) {
        return;
    }
    for (HJBezierPath *path in self.paths) {
        
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawAtPoint:(CGPointZero)];
        } else {
        
        //在这里设置后所有的都会设置线宽,可以在创建的时候设置
        //设置颜色
        [path.color set];
        [path stroke];
        }
    }
}
- (CGPoint)pointWithTouches:(NSSet<UITouch *> *)touches  {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}
//创建bezierPath
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取起点
    CGPoint point = [self pointWithTouches:touches];
    HJBezierPath *path = [HJBezierPath bezierPathWithLineWidth:_lineWidth color:_color startPoint:point];
    _path = path;
    [self.paths addObject:_path];
    /*
    HJBezierPath *path = [HJBezierPath bezierPath];
    path.color = _color;
    [path setLineWidth:_lineWidth];
    _path = path;
    [self.paths addObject:_path];
    
    [path moveToPoint:point];
     */
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取点
    CGPoint point = [self pointWithTouches:touches];
    [_path addLineToPoint:point];
    
    //重新绘制
    [self setNeedsDisplay];
}
- (void)cleanScreen {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}
- (void)undo {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
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
- (void)setDrawImage:(UIImage *)drawImage {
    _drawImage = drawImage;
    //加到数组
    [self.paths addObject:_drawImage];
    [self setNeedsDisplay];
}
@end
