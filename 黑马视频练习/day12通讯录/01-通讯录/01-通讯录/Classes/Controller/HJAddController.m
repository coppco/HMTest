//
//  HJAddController.m
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJAddController.h"

@interface HJAddController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *add;

@end

@implementation HJAddController
- (IBAction)add:(UIButton *)sender {
    if (self.addBlock) {
        self.addBlock(_name.text,_phone.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_name becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_name addTarget:self action:@selector(targetAction:) forControlEvents:(UIControlEventEditingChanged)];
    [_phone addTarget:self action:@selector(targetAction:) forControlEvents:(UIControlEventEditingChanged)];
    [self targetAction:nil];
}
- (void)targetAction:(UITextField *)textField {
    self.add.enabled = 0 != _name.text.length && 0 != self.phone.text.length;
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
