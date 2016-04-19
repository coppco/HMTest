//
//  HJHTMLViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJHTMLViewController.h"
#import "HJHelpModel.h"
@interface HJHTMLViewController ()<UIWebViewDelegate>

@end

@implementation HJHTMLViewController
- (void)loadView {
    self.view = [[UIWebView alloc] init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(cancel)];
    
    UIWebView *web = (UIWebView *)self.view;
    web.delegate = self;
    [web loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:_model.html withExtension:nil]]];
}
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//加载完成之后调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@'", _model.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
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
