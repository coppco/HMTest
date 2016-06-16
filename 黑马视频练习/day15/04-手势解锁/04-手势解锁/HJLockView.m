//
//  HJLockView.m
//  04-手势解锁
//
//  Created by M-coppco on 16/4/5.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJLockView.h"

@interface HJLockView ()
/*存放选择button的数组*/
@property (nonatomic, strong)NSMutableArray  *btns;
/*存放最后一个点的位置*/
@property (nonatomic, assign)CGPoint  lastPoint;
/*密码*/
@property (nonatomic, copy)NSMutableString *password;
@end

@implementation HJLockView
/**
 懒加载
 */
- (NSMutableArray *)btns {
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}
/**
 *  代码初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addButton];
    }
    return self;
}
/**
 *  从xib初始化方法
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addButton];
    }
    return self;
}
/**
 *  添加按钮
 */
- (void) addButton {
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.tag = i;
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:(UIControlStateNormal)];
         [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        button.userInteractionEnabled = NO;
        [self addSubview:button];
    }
}
/**
 *  给button设置frame
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat col = 0;
    CGFloat row = 0;
    
    CGFloat btnW = 74;
    CGFloat btnH = 74;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    CGFloat total = 3;
    CGFloat margin = (self.bounds.size.width - total * btnW) / (total + 1);
    //设置按钮的位置
    for (int i = 0; i < self.subviews.count; i++) {
        UIView *view = self.subviews[i];
        col = i % 3;
        row = i / 3;
        btnX = margin + (margin + btnW) * col;
        btnY = margin + (margin + btnH) * row;
        
        view.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
//获取触摸点
- (CGPoint)pointWithTouches:(NSSet<UITouch *> *)touches {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}
//获取点所在的button
- (UIButton *)buttonWithPoint:(CGPoint)point {
    
    for (UIButton *button in self.subviews) {
//        CGRect frame = CGRectMake(button.center.x - 15, button.center.y - 15, 30, 30); //提高button的精准度
        if (CGRectContainsPoint(button.frame, point)) {
            return button;
        }
    }
    return nil;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.password = nil;
    CGPoint point = [self pointWithTouches:touches];
    UIButton *button = [self buttonWithPoint:point];
    if (button && button.selected == NO) {
        button.selected = YES;
        [self.btns addObject:button];
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [self pointWithTouches:touches];
    //记录点
    _lastPoint = point;
    UIButton *button = [self buttonWithPoint:point];
    if (button && button.selected == NO) {
        button.selected = YES;
        [self.btns addObject:button];
    }
    //重绘制
    [self setNeedsDisplay];
}
//触摸结束  清空状态
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //取消选择按钮的选中状态
//    [self.btns makeObjectsPerformSelector:@selector(setSelected:) withObject:@NO]; //为什么没作用
    NSMutableString *string = [NSMutableString string];
    for (UIButton *btn in self.btns) {
        [string appendFormat:@"%ld", (long)btn.tag];
        btn.selected = NO;
    }
    self.password = string;
    NSLog(@"%@", self.password);
    //从数组中移除数据
    [self.btns removeAllObjects];
    //重绘
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    if (!self.btns.count) {
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < _btns.count; i++) {
        UIButton *button = _btns[i];
        if (i == 0) {
            [path moveToPoint:button.center];
        } else {
            [path addLineToPoint:button.center];
        }
    }
    [path addLineToPoint:_lastPoint];
    [path setLineWidth:10];
    [[UIColor greenColor] set];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
}
@end
