//
//  HJOAuthViewController.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/14.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJOAuthViewController.h"
#import "WeiboSDK.h"
#import <AFNetworking.h>
#import "HJAccount.h"
#import "HJAccountTool.h"
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
    NSURL *url = [NSURL URLWithString:STR(@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=http://www.baidu.com",kSinaAppKey)];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.OAuthWeb loadRequest:request];
    [self.OAuthWeb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //1⃣️获取url
    NSString  *url = request.URL.absoluteString;
    //2⃣️判断是否为毁掉地址
    NSRange range = [url rangeOfString:@"code="];
    if (range.location != NSNotFound) {//是回调地址
        NSString *code = [url substringFromIndex:(range.location + range.length)];
        //利用得到的code获取Token
        [self accessTokenWithCode:code];
        return NO; //不加载回调地址
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showMessage:@"正在加载"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    [MBProgressHUD hideHUD];
}
- (void)accessTokenWithCode:(NSString *)code {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = kSinaAppKey;
    params[@"client_secret"] = kSinaAppSecret ;
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://www.baidu.com";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];

    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        [MBProgressHUD hideHUD];
        XHJLog(@"%@", kSinaPlist);
        //保存到沙盒
        HJAccount *account = [[HJAccount alloc] initWithDictionary:responseObject error:nil];
        [HJAccountTool saveAccount:account];
        //切换root
        [getAppWindow() switchRootController];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUD];
    }];
}
@end
