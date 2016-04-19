//
//  HJShareViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJShareViewController.h"
#import "HJSettingItem.h"

@interface HJShareViewController ()

@end

@implementation HJShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstSection];
}
- (void)addFirstSection {
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"新浪分享" image:@"WeiboSina" type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"短信分享" image:@"SmsShare" type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    HJSettingItem *item3 = [HJSettingItem settingItemWithTitle:@"邮件分享" image:@"MailShare" type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    HJSettingGroup *group = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item1,item2,item3].mutableCopy footerTitle:@""];
    [self.dataList addObject:group];
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
