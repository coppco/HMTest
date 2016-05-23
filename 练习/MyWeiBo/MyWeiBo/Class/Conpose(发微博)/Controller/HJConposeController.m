//
//  HJConposeController.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/23.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJConposeController.h"
#import "HJAccountTool.h"
#import "HJAccount.h"
#import "HJTextView.h"  //带占位符的textView
@interface HJConposeController ()
@property (nonatomic, strong)HJTextView  *textView;
@end

@implementation HJConposeController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textView becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //scrollvie会自动适应contentInset
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self configNavigationBarButtonItem];
    [self initSubView];
}
- (void)initSubView {
    self.textView = [[HJTextView alloc] init];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
- (void)configNavigationBarButtonItem {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(dismiss:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发微博" style:(UIBarButtonItemStylePlain) target:self action:@selector(dismiss:)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    UILabel *titleL = [[UILabel alloc] init];
    titleL.size = CGSizeMake(150, 44);
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.numberOfLines = 0;
    NSString *str = STR(@"发微博\n%@", [HJAccountTool getAccount].name);
    //可变的
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:str];
    //后面的字体
    [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(4, [HJAccountTool getAccount].name.length)];
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, [HJAccountTool getAccount].name.length)];
    
    titleL.attributedText = title;

    self.navigationItem.titleView = titleL;
}
//消失
- (void)dismiss:(UIBarButtonItem *)button {
    if (button == self.navigationItem.leftBarButtonItem) {
        [self.textView resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        XHJLog(@"发微博");
    }
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
