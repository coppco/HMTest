//
//  HJSettingTableViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/15.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJSettingTableViewController.h"
#import "HJSettingItem.h"   //模型

#import "MBProgressHUD+MJ.h"
#import "HJProducCollectionViewController.h"  //推广产品
#import "HJPushViewController.h"  //推送
@interface HJSettingTableViewController ()

@end

@implementation HJSettingTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self addFirstSection];
    [self addSecondSection];
}
- (void)addFirstSection {
    //推送提醒
    HJSettingItem *item = [HJSettingItem settingItemWithTitle:@"推送和提醒" image:@"MorePush" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        HJPushViewController *push = [[HJPushViewController alloc] init];
        push.title = @"推送和提醒" ;
        [self.navigationController pushViewController:push animated:YES];
    }];
    //摇一摇
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"摇一摇" image:@"handShake" type:(HJSettingItemTypeSwitch) labelText:nil selected:^() {
        
    }];
    //声音效果
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"声音效果" image:@"sound_Effect" type:(HJSettingItemTypeSwitch) labelText:nil selected:^() {
        
    }];
    HJSettingGroup *group1 = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item,item1,item2].mutableCopy footerTitle:@""];
    [self.dataList addObject:group1];
}
- (void)addSecondSection {
    //检查最新版本
    HJSettingItem *item = [HJSettingItem settingItemWithTitle:@"检查最新版本" image:@"MoreUpdate" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        [MBProgressHUD showMessage:@"正在加载"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的版本已经是最新版本" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        });
    }];
    //帮助
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"帮助" image:@"MoreHelp" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        
    }];
    //分享
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"分享" image:@"MoreShare" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        
    }];
    //查看消息
    HJSettingItem *item3 = [HJSettingItem settingItemWithTitle:@"查看消息" image:@"MoreMessage" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        
    }];
    //产品推广
    HJSettingItem *item4 = [HJSettingItem settingItemWithTitle:@"产品推广" image:@"MoreNetease" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        HJProducCollectionViewController *productVC = [[HJProducCollectionViewController alloc] init];
        [self.navigationController pushViewController:productVC animated:YES];
    }];
    //关于
    HJSettingItem *item5 = [HJSettingItem settingItemWithTitle:@"关于" image:@"MoreAbout" type:(HJSettingItemTypeArrow) labelText:nil selected:^() {
        
    }];
    HJSettingGroup *group2 = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item,item1,item2,item3,item4,item5].mutableCopy footerTitle:@""];
    [self.dataList addObject:group2];
}
#pragma mark - Table view data source


@end
