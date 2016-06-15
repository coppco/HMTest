//
//  HJAboutViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJAboutViewController.h"
#import "HJSettingItem.h"
@interface HJAboutViewController ()

@end

@implementation HJAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstSection];
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"HJAboutHeaderView" owner:nil options:nil] firstObject];
    self.tableView.tableHeaderView = view;
}
- (void)addFirstSection {
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"评分支持" image:nil type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"客服电话" image:nil type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    item2.subTitle = @"0571-8888888";
    HJSettingGroup *group = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item1,item2].mutableCopy footerTitle:@""];
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
