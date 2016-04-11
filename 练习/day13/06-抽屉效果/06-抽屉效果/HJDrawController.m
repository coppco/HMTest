//
//  HJDrawController.m
//  06-抽屉效果
//
//  Created by M-coppco on 16/3/25.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJDrawController.h"

@interface HJDrawController ()
@property (nonatomic, strong)UIView  *leftView;
@property (nonatomic, strong)UIView  *rightView;
@property (nonatomic, strong)UIView  *mainView;
@end

@implementation HJDrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1  添加子视图
    [self addChildView];
    //2  添加观察者:监听frame    NSKeyValueObservingOptionNew新值
    [_mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
}
//监听者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
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

- (void)addChildView {
    //left
    _leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    _leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_leftView];
    
    //right
    _rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    _rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_rightView];
    
    //main
    _mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    _mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_mainView];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint current = [touch locationInView:self.view];
    CGPoint previous = [touch previousLocationInView:self.view];

    CGRect frame = self.mainView.frame;
    frame.origin.x += (current.x - previous.x);
    self.mainView.frame = frame;
}
@end
