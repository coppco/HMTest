//
//  ViewController.m
//  01-layer基本使用
//
//  Created by M-coppco on 16/4/7.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//    _redView.backgroundColor = [UIColor redColor];
    _redView.layer.shadowOpacity = 3;  //阴影不透明度
//    _redView.layer.shadowOffset = CGSizeMake(3, 2);//阴影偏移量
    _redView.layer.shadowColor = [UIColor yellowColor].CGColor;  //阴影颜色
    _redView.layer.shadowRadius = 10;  //阴影圆角半径
    _redView.layer.cornerRadius = _redView.frame.size.width / 2;   //图层的半径
    _redView.layer.borderColor = [UIColor whiteColor].CGColor;  //图层边框颜色
    _redView.layer.borderWidth = 4; //图层的边框颜色
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    _redView.layer.contents = (__bridge id _Nullable)(image.CGImage);   //可以放图片
//    _redView.layer.masksToBounds = YES; //裁剪
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:1 animations:^{
        //layer的形变
        
        //直接更改
       // _redView.layer.transform = CATransform3DRotate(_redView.layer.transform, M_PI_4, 1, 1, 0);
        //结构体转换为对象
        [NSValue valueWithCATransform3D:CATransform3DRotate(_redView.layer.transform, M_PI_4, 1, 1, 0) ];
        //使用KVC
        //三维
        [_redView.layer setValue:[NSValue valueWithCATransform3D:CATransform3DRotate(_redView.layer.transform, M_PI_4, 1, 1, 0) ] forKeyPath:@"transform"];
        
        //二维
//        [_redView.layer setValue:@M_PI_4 forKeyPath:@"transform.rotation"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
