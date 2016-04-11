//
//  ViewController.m
//  01-图片水印
//
//  Created by M-coppco on 16/4/5.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //图片水印
    [self imageShuiYin];
}
- (void)imageShuiYin {
    UIImage *image = [UIImage imageNamed:@"小新"];
    /**
     *  开启上下文
     * size  新照片的尺寸
     * opaque 不透明度  YES----->透明  NO---->不透明
     * scale  缩放
     */
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    [image drawAtPoint:CGPointZero];
    /*  
     //文字
    NSString *title = @"蜡笔小新";
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]};
    [title drawAtPoint:CGPointMake(0, image.size.height - 30) withAttributes:dict];
    */
    
    
     //图片
    UIImage *i = [UIImage imageNamed:@"img"];
    [i drawInRect:CGRectMake(image.size.width - 60, image.size.height - 60, 60, 60) blendMode:kCGBlendModeNormal alpha:1];
    
    //获取图片
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    UIImageView *view = [[UIImageView alloc] initWithImage:new];
    [self.view addSubview:view];
    view.frame = CGRectMake(100, 100, new.size.width, new.size.height);
    //把图片转换为data
    NSData *data = UIImagePNGRepresentation(new);
    //写到文件
    //    [data writeToFile:@"" atomically:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
