//
//  HJOAuthViewController.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/14.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJOAuthViewController.h"
#import "WeiboSDK.h"

@interface HJOAuthViewController ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView  *OAuthWeb;
@end

@implementation HJOAuthViewController

- (UIWebView *)OAuthWeb {
    if (!_OAuthWeb) {
        _OAuthWeb = [[UIWebView alloc] init];
        _OAuthWeb.delegate = self;
//        _OAuthWeb.scrollView.scrollEnabled = NO;
        [self.view addSubview:_OAuthWeb];
    }
    return _OAuthWeb;
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSURL *url = [NSURL URLWithString:STR(@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=http://www.baidu.com",kSinaAppKey)];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.OAuthWeb loadRequest:request];
//    [self.OAuthWeb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];

    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://www.baidu.com";
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"HJOAuthViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
}

@end
