//
//  ViewController.m
//  MeasuringTool
//
//  Created by M-coppco on 16/3/13.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>  //提示框
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *turnAngleT; //转向角
@property (weak, nonatomic) IBOutlet UITextField *radiusT;//半径R
@property (weak, nonatomic) IBOutlet UITextField *tangentT;//切线T
@property (weak, nonatomic) IBOutlet UITextField *vectorT;//外矢距离E
@property (weak, nonatomic) IBOutlet UITextField *curveT;//曲线长L
@property (weak, nonatomic) IBOutlet UITextField *stakeNumberT;//交点桩号
@property (weak, nonatomic) IBOutlet UILabel *ZYL;
@property (weak, nonatomic) IBOutlet UILabel *QZL;
@property (weak, nonatomic) IBOutlet UILabel *YZL;

@property (weak, nonatomic) IBOutlet UIButton *buttonR;
@property (weak, nonatomic) IBOutlet UIButton *buttonE;
@property (weak, nonatomic) IBOutlet UIButton *buttonL;

@property (nonatomic, strong)MBProgressHUD  *hud;
@end

@implementation ViewController
- (MBProgressHUD *)hud {
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.mode = MBProgressHUDModeText;  //文本
        [self.view addSubview:_hud];
    }
    return _hud;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%f", tan(M_PI / 4));
}

- (IBAction)buttonClick:(UIButton *)sender {
    CGFloat turnA = self.turnAngleT.text.floatValue;
    if (turnA < 0 || turnA >= 180 || self.turnAngleT.text.length == 0) {
        self.turnAngleT.textColor = [UIColor redColor];
        self.hud.labelText = @"转向角输入有误!";
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:1.0];
        return;
    }
    CGFloat stake = self.stakeNumberT.text.floatValue;
    if (stake < 0 || self.stakeNumberT.text.length == 0) {
        self.stakeNumberT.textColor = [UIColor redColor];
        self.hud.labelText = @"桩号输入有误!";
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:1.0];
        return;
    }
    CGFloat radius = self.radiusT.text.floatValue;
    if (radius <= 0 || self.radiusT.text.length == 0) {
        self.radiusT.textColor = [UIColor redColor];
        self.hud.labelText = @"曲线半径输入有误!";
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:1.0];
        return;
    }
    
    //开始正式计算
    [self computing];
}
//计算
- (void)computing {
    //角度转弧度
    
    CGFloat turnA = self.turnAngleT.text.floatValue * (M_PI / 180);
    CGFloat stake = self.stakeNumberT.text.floatValue;
    CGFloat radius = self.radiusT.text.floatValue;
    
    //切线T
    double t = radius * tan(turnA / 2);
    self.tangentT.text = [NSString stringWithFormat:@"%.3f",t];
    
    //外矢E
    double e = radius * (1 / cos(turnA / 2) - 1);
    self.vectorT.text = [NSString stringWithFormat:@"%.3f",e];
    
    //曲线L
    double l = radius * turnA;
    self.curveT.text = [NSString stringWithFormat:@"%.3f",l];
    
    //ZY
    self.ZYL.text = [NSString stringWithFormat:@"%.3f",stake - t];
    
    //QZ
    self.QZL.text = [NSString stringWithFormat:@"%.3f",stake - t + l / 2];
    
    //YZ
    self.YZL.text = [NSString stringWithFormat:@"%.3f",stake - t + l];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.textColor = [UIColor blackColor];
}
//键盘回收
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.turnAngleT) {
        [self.stakeNumberT becomeFirstResponder];
    } else if (textField == self.stakeNumberT) {
        [self.radiusT becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
