//
//  ViewController.m
//  0813-图片查看器
//
//  Created by M-coppco on 15/12/21.
//  Copyright © 2015年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UILabel *noLabel;
@property (nonatomic, strong)UIImageView *iconImage;
@property (nonatomic, strong)UILabel *descLabel;
@property (nonatomic, strong)UIButton *leftButton;
@property (nonatomic, strong)UIButton *rightButton;

@property (nonatomic, assign)NSInteger index; //当前显示的图片
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 1;
    // Do any additional setupafter loading the view, typically from a nib.
    //1.序号
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 40)];
    self.noLabel.text = @"1/5";
    self.noLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.noLabel];
    //2.图片
    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
    self.iconImage.center = CGPointMake(self.view.center.x, (self.view.center.y - 40 - 20) / 2 + 100);
    self.iconImage.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.iconImage];
    
    //3.描述文字
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.iconImage.frame), self.view.bounds.size.width, 100)];
    self.descLabel.text = @"神马表情";
    self.descLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.descLabel];
    
    //4.左边按钮
    self.leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.leftButton.frame = CGRectMake(0, 0, 40, 40);
    self.leftButton.center = CGPointMake(self.iconImage.frame.origin.x * 0.5, self.iconImage.center.y);
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:(UIControlStateNormal)];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:(UIControlStateNormal)];
    [self.leftButton addTarget:self action:@selector(prePhoto) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.leftButton];
    
    //4.右边按钮
    self.rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.rightButton.frame = CGRectMake(0, 0, 40, 40);
    self.rightButton.center = CGPointMake(self.view.bounds.size.width - self.iconImage.frame.origin.x * 0.5, self.iconImage.center.y);
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:(UIControlStateNormal)];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:(UIControlStateNormal)];
    [self.rightButton addTarget:self action:@selector(nextPhoto) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.rightButton];
}
//下一张照片
- (void)nextPhoto {
    NSLog(@"%d--%s", __LINE__, __func__);
    
    switch (self.index) {
        case 0:
            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"]
            ;
            self.descLabel.text = @"神马表情";
            break;
        case 1:
            self.iconImage.image = [UIImage imageNamed:@"bingli"];
            self.descLabel.text = @"病例";
            break;
        case 2:
            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
            self.descLabel.text = @"吃牛扒";
            break;
        case 3:
            self.iconImage.image = [UIImage imageNamed:@"danteng"];
            self.descLabel.text = @"蛋疼";
            break;
        case 4:
            self.iconImage.image = [UIImage imageNamed:@"wangba"];
            self.descLabel.text = @"王八";
            break;
    }
    self.index++;
    self.noLabel.text = [NSString stringWithFormat:@"%ld/5", self.index];
    self.rightButton.enabled = (self.index != 5);
    /**
     if (self.index == 5) {
     self.rightButton.enabled = NO;
     } else {
     self.rightButton.enabled = YES;
     }
     */
}
- (void)prePhoto {
    switch (self.index) {
        case 0:
            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"]
            ;
            self.descLabel.text = @"神马表情";
            break;
        case 1:
            self.iconImage.image = [UIImage imageNamed:@"bingli"];
            self.descLabel.text = @"病例";
            break;
        case 2:
            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
            self.descLabel.text = @"吃牛扒";
            break;
        case 3:
            self.iconImage.image = [UIImage imageNamed:@"danteng"];
            self.descLabel.text = @"蛋疼";
            break;
        case 4:
            self.iconImage.image = [UIImage imageNamed:@"wangba"];
            self.descLabel.text = @"王八";
            break;
    }
    self.index--;
    self.noLabel.text = [NSString stringWithFormat:@"%ld/5", self.index];
    self.leftButton.enabled = (self.index != 1);
    self.rightButton.enabled = (self.index != 5);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
