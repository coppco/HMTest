//
//  HMDrawViewController.m
//  06-抽屉效果
//
//  Created by apple on 14-9-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMDrawViewController.h"

@interface HMDrawViewController ()


@property (nonatomic, assign) BOOL isDraging;
@end

@implementation HMDrawViewController


- (void)viewDidLoad
{
    // UIViewController
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    // 1.添加子控件
    [self addChildView];
#warning 第三步 观察_mainView的frame改变
    // 2.监听
    /**
     *  给_mainView添加一个观察者
     *
     *  KeyPath：监听frame这个属性
     *
     *  options：监听新值的改变
     */
    [_mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
   
}

// 当_mainView的frame属性改变的时候就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", NSStringFromCGRect(_mainView.frame));
    
    if (_mainView.frame.origin.x < 0) { // 往左移动
        // 显示右边
        _rightView.hidden = NO;
        // 隐藏左边
        _leftView.hidden = YES;
    }else if (_mainView.frame.origin.x > 0){ // 往右移动
        // 显示左边
        _rightView.hidden = YES;
        // 隐藏右边
        _leftView.hidden = NO;
        
    }
}

#warning 第一步
- (void)addChildView
{
    // left
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftView];
    _leftView = leftView;
    
    // right
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rightView];
    _rightView = rightView;
    
    // mainView
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    _mainView = mainView;
}

#warning 第二布
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取UITouch对象
    UITouch *touch = [touches anyObject];
    
    // 获取当前点
    CGPoint currentPoint = [touch locationInView:self.view];
    
    // 获取上一个点
    CGPoint prePoint = [touch previousLocationInView:self.view];
    
    // x轴偏移量：当手指移动一点的时候，x偏移多少
    CGFloat offsetX = currentPoint.x - prePoint.x;
    
    // 设置当前主视图的frame
    _mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];
    
    
    _isDraging = YES;
}
#warning 第四步
#define HMMaxY 60
// 当手指偏移一点，根据X轴的偏移量算出当前主视图的frame
- (CGRect)getCurrentFrameWithOffsetX:(CGFloat)offsetX
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    // 获取y轴偏移量，手指每移动一点，y轴偏移多少
    CGFloat offsetY = offsetX * HMMaxY / screenW;
    
    CGFloat scale = (screenH - 2 * offsetY) / screenH;
    
    if (_mainView.frame.origin.x < 0) { // 往左边滑动
        scale = (screenH + 2 * offsetY) / screenH;
    }
    
    // 获取之前的frame
    CGRect frame = _mainView.frame;
    frame.origin.x += offsetX;
    frame.size.height = frame.size.height *scale;
    frame.size.width = frame.size.width *scale;
    frame.origin.y = (screenH - frame.size.height) * 0.5;
    
    return frame;
}

#define HMRTarget 250
#define HMLTarget -220
/*
 _mainView.frame.origin.x > screenW * 0.5 定位到右边
  CGRectGetMaxX(_mainView.frame) < screenW * 0.5 定位到左边 -220
 
 */
// 定位
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // 复位
    if (_isDraging == NO && _mainView.frame.origin.x != 0) {
        [UIView animateWithDuration:0.25 animations:^{
            
            _mainView.frame = self.view.bounds;
        }];
    }
    
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat target = 0;
    if (_mainView.frame.origin.x > screenW * 0.5) { // 定位到右边
        target = HMRTarget;
    }else if (CGRectGetMaxX(_mainView.frame) < screenW * 0.5) { // 定位到左边
        target = HMLTarget;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        if (target) { // 在需要定位左边或者右边
            
            // 获取x轴偏移量
            CGFloat offsetX = target - _mainView.frame.origin.x;
            
            // 设置当前主视图的frame
            _mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];
            
        }else{ // 还原
            _mainView.frame = self.view.bounds;
        }
    }];
    
    _isDraging = NO;
    
}


@end
