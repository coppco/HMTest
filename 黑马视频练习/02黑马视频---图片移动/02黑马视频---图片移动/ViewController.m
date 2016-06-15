//
//  ViewController.m
//  02黑马视频---图片移动
//
//  Created by M-coppco on 15/11/25.
//  Copyright © 2015年 M-coppco. All rights reserved.
//
/**
 控件的transform属性可以更改平移 旋转 缩放
 
 
 带make的是基于原始位置,不带make的是基于上次位置
 平移:
 CGAffineTransformTranslate  基于上次位置
 CGAffineTransformMakeTranslation 基于原始位置
 旋转
 CGAffineTransformRotate 基于上次位置
 CGAffineTransformMakeRotation 基于原始位置
 缩放
 CGAffineTransformScale 基于上次位置
 CGAffineTransformMakeScale 基于原始位置
 */

#import "ViewController.h"
/**
 宏定义
 */
#define kMoving 20
/**
 枚举类型是解决魔法数字比较常用的手段
 */
typedef enum {
    kMovingDirTop = 1000,
    kMovingDirBottom,
    kMovingDirLeft,
    kMovingDirRight
}kMovingDir;

typedef NS_ENUM(NSInteger, kZooming) {
    kZoomingBig = 2001,
    kZoomingXiao,
};
typedef NS_ENUM(NSInteger, kZooming1) {
    kZoomingBig1 = 2003,
    kZoomingXiao1,
};
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;


@end

@implementation ViewController
/**
 *  1. 基本功能实现
 *
 *  2. 对代码优化,尽量让重复的代码只出现一次
 *
 */

/**
     优化代码 
*  只使用一个方法 使用tag值判断
*/
- (IBAction)move:(UIButton *)sender {
    //1⃣️  取出frame
//    CGRect frame = self.iconButton.frame;
    //2⃣️ 根据tag值判断移动方向,再修改
    switch (sender.tag) {
        case kMovingDirTop:       //上
            self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, 0, -kMoving);
            //frame.origin.y -= kMoving;
            break;
        case kMovingDirBottom: // 下
            //frame.origin.y += kMoving;
            self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, 0, kMoving);
            break;
        case kMovingDirLeft:  //左
            //frame.origin.x -= kMoving;
           self.iconButton.transform =  CGAffineTransformTranslate(self.iconButton.transform, -kMoving, 0);
            break;
        case kMovingDirRight:   //右
            //frame.origin.x += kMoving;
            self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, kMoving, 0);
            break;
    }
    // 3⃣️ 设置frame
//    self.iconButton.frame = frame;
}



  /*
//向上
- (IBAction)top:(UIButton *)sender {
    CGRect frame = self.iconButton.frame;
    frame.origin.y -= 20;
    self.iconButton.frame = frame;
}
//向下
- (IBAction)down:(UIButton *)sender {
    CGRect frame = self.iconButton.frame;
    frame.origin.y += 20;
    self.iconButton.frame = frame;
}
//向右
- (IBAction)right:(UIButton *)sender {
    CGRect frame = self.iconButton.frame;
    frame.origin.x += 20;
    self.iconButton.frame = frame;
}
//向左
- (IBAction)left:(UIButton *)sender {
    CGRect frame = self.iconButton.frame;
    frame.origin.x -= 20;
    self.iconButton.frame = frame;
}
 */
//放大缩小
- (IBAction)zoom:(UIButton *)sender {
//    UILabel *label;
//    label.adjustsFontSizeToFitWidth
    //可以使用frame或者bounds 或者
    //1 取出bounds
    //CGRect bounds = self.iconButton.bounds;
    if (sender.tag == 2001) {
        NSLog(@"放大");
//        bounds.size.width += kMoving;
//        bounds.size.height += kMoving;
        self.iconButton.transform = CGAffineTransformScale(self.iconButton.transform, 1.2, 1.2);
    } else {
        NSLog(@"缩小");
//        bounds.size.width -= kMoving;
//        bounds.size.height -= kMoving;
        self.iconButton.transform = CGAffineTransformScale(self.iconButton.transform, 0.8, 0.8);
    }
//    self.iconButton.bounds = bounds;
}
//旋转
- (IBAction)zoom1:(UIButton *)sender {

   
    switch (sender.tag) {
        case kZoomingBig1:
            self.iconButton.transform = CGAffineTransformRotate(self.iconButton.transform, M_PI_4);
            break;
            
        case kZoomingXiao1:
            self.iconButton.transform = CGAffineTransformRotate(self.iconButton.transform, -M_PI_4);
            break;
    }
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
