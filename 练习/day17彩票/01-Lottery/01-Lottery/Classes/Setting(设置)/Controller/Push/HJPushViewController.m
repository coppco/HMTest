//
//  HJPushViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJPushViewController.h"
#import "HJSettingItem.h"
#import "HJScoreNoticeViewController.h"  //比分直播
@interface HJPushViewController ()

@end

@implementation HJPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstSection];
}


- (void)addFirstSection {
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"开奖号码推送" image:nil type:(HJSettingItemTypeArrow)  labelText:nil selected:^{
        
    }];
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"开奖动画" image:nil type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    HJSettingItem *item3 = [HJSettingItem settingItemWithTitle:@"比分直播提醒" image:nil type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        HJScoreNoticeViewController *score = [[HJScoreNoticeViewController alloc] init];
        score.title = @"比分直播提醒";
        [self.navigationController pushViewController:score animated:YES];
    }];
    HJSettingItem *item4 = [HJSettingItem settingItemWithTitle:@"购彩定时提醒" image:nil type:(HJSettingItemTypeArrow) labelText:nil selected:^{
        
    }];
    HJSettingGroup *group = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item1,item2,item3,item4].mutableCopy footerTitle:@""];
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
