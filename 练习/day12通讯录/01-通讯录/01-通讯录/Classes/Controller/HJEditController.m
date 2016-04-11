//
//  HJEditController.m
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJEditController.h"
#import "HJContact.h"
@interface HJEditController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *save;

@end

@implementation HJEditController
- (IBAction)save:(UIButton *)sender {
    //回到上一界面
    [self.navigationController popViewControllerAnimated:YES];
    //更新数据
    self.contact.name = _name.text;
    self.contact.phone = _phone.text;
    if (self.saveBlock){
        self.saveBlock(self.contact);
    }
}
//编辑
- (IBAction)edit:(UIBarButtonItem *)sender {
    self.name.enabled = self.save.hidden;
    self.phone.enabled = self.save.hidden;
    if (self.save.hidden) {
        sender.title = @"取消";
        [_phone becomeFirstResponder];
    } else {
        sender.title = @"编辑";
        _phone.text = _contact.phone;
        _name.text = _contact.name;
        [self.view endEditing:YES];
    }
    self.save.hidden = !self.save.hidden;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = _contact.name;
    self.phone.text = _contact.phone;
    [_name addTarget:self action:@selector(targetAction:) forControlEvents:(UIControlEventEditingChanged)];
    [_phone addTarget:self action:@selector(targetAction:) forControlEvents:(UIControlEventEditingChanged)];
    [self targetAction:nil];
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *aa = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", aa);
    [[NSUserDefaults standardUserDefaults] setObject:@"1111" forKey:@"1"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)targetAction:(UITextField *)textField {
    self.save.enabled = 0 != _name.text.length && 0 != self.phone.text.length;
}

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
