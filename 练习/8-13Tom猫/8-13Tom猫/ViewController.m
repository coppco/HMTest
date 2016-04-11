//
//  ViewController.m
//  8-13Tom猫
//
//  Created by M-coppco on 15/12/24.
//  Copyright © 2015年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation ViewController

/**
 *  代码重构
    将重复的代码复制到新方法中,根据参数进行调整
 */
/**
 *  关于图像的实例化
   imageName:系统推荐的方法,但是图像实例化之后由系统负责
 可以使用imageWithContentsOfFile:优化,在动画播放完毕后把imageview的animationimages置为nil,但是图片不能放在
 
 */
- (void)animationWithName:(NSString *)name count:(NSInteger)count {
    /**
     *  序列帧动画 
     *
     *  @return 顺序播放图片数组
     */
    
    if (self.imageV.isAnimating) {
        return;
    }
    NSMutableArray *imageArray = [NSMutableArray array];
    //首先需要数组存放图片
    for (int i = 0; i < count; i++) {
        NSString *string = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        //imageName: 释放由系统负责
//        UIImage *image = [UIImage imageNamed:string];
        NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:nil];
        //contentsOfFile:
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [imageArray addObject:image];
    }
    self.imageV.animationImages = imageArray;
    //设置动画时长
    self.imageV.animationDuration = imageArray.count * 0.075;
    //设置动画重复次数
    self.imageV.animationRepeatCount = 1;
    //开始动画
    [self.imageV startAnimating];
    
    //动画结束之后, 清理动画数组  使用performSelector方法延迟时间就是imageView的动画持续时间
    
    //本类执行方法
    //[self performSelector:@selector(clearup) withObject:nil afterDelay:self.imageV.animationDuration];
    //self.imageV执行方法
    [self.imageV performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageV.animationDuration];
}
- (void)clearup {
    NSLog(@"%s", __func__);
    self.imageV.animationImages = nil;
}
//打脑袋
- (IBAction)knockout:(UIButton *)sender {
    [self animationWithName:@"knockout" count:81];
}
//吃
- (IBAction)eat:(UIButton *)sender {
    [self animationWithName:@"eat" count:40];
}

//统一一个方法
- (IBAction)tomAction:(UIButton *)sender {
    [self animationWithName:sender.currentTitle count:sender.tag];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [NSBundle mainBundle]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
