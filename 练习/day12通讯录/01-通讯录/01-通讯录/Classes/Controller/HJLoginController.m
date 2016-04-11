//
//  HJLoginController.m
//  01-通讯录
//
//  Created by M-coppco on 16/3/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJLoginController.h"
#import "MBProgressHUD+MJ.h"

@interface HJLoginController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountT;
@property (weak, nonatomic) IBOutlet UITextField *passwordT;
@property (weak, nonatomic) IBOutlet UIButton *loginB;

@property (weak, nonatomic) IBOutlet UISwitch *rmbS;
@property (weak, nonatomic) IBOutlet UISwitch *autoS;
@end

@implementation HJLoginController
//记住密码
- (IBAction)rmbSwitch:(UISwitch *)sender {
    if (sender.isOn == NO) {
        [self.autoS setOn:NO animated:YES];
    }
}
- (IBAction)atoSwitch:(UISwitch *)sender {
    if (sender.isOn == YES) {
        [self.rmbS setOn:YES animated:YES];
    }
}
- (IBAction)login:(UIButton *)sender {
    //判断用户名和密码是否正确
    if ([self.accountT.text isEqualToString:@"123"] && [self.passwordT.text isEqualToString:@"123"]) {
        //正确
        //方法1:
        /*
        UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *VC = [mainSB instantiateViewControllerWithIdentifier:@"HJContactController"];
        [self.navigationController pushViewController:VC animated:YES];
         */
        //方法2:执行segue
//        [self performSegueWithIdentifier:@"toContactVC" sender:nil];
        [MBProgressHUD showMessage:@"正在登陆中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            //获取segue
            
            [self performSegueWithIdentifier:@"toContactVC" sender:nil];
        });
    } else {
        [MBProgressHUD showError:@"账号或者密码错误"];
    }
}
/**
 *  执行segue的时候,跳转之前调用
    一般在跳转前做一些操作,如传值
 *
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *v = segue.destinationViewController;
    v.title = [NSString stringWithFormat:@"%@的联系人",self.accountT.text];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  监听文本框的内容
     */
    //方法1:代理
//    _accountT.delegate = self;
//    _passwordT.delegate = self;
    //方法2:通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    //方法3:文本框添加target action
    [_accountT addTarget:self action:@selector(targetAction:) forControlEvents:(UIControlEventEditingChanged)];
     [_passwordT addTarget:self action:@selector(targetAction:) forControlEvents:(UIControlEventEditingChanged)];
    [self targetAction:nil];
    
    [[UIApplication sharedApplication].keyWindow hitTest:self.view.center withEvent:nil];
}
- (void)targetAction:(UITextField *)textField {
//    if (0 != self.accountT.text.length && 0 != self.passwordT.text.length) {
//        self.loginB.enabled = YES;
//    } else {
//        self.loginB.enabled = NO;
//    }
    self.loginB.enabled = 0 != self.accountT.text.length && 0 != self.passwordT.text.length;
}
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//- (void)textFieldChange:(NSNotification *)notification {
//    UITextField *textField = notification.object;
//    NSLog(@"通知:%@", textField.text);
//}
//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    NSLog(@"代理:%@", textField.text);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
