//
//  HJScoreNoticeViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJScoreNoticeViewController.h"
#import "HJSettingItem.h"


@interface HJScoreNoticeViewController ()

@end

@implementation HJScoreNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstSection];
    [self addSecondSection];
}
- (void) addFirstSection  {
    HJSettingItem *item = [HJSettingItem settingItemWithTitle:@"提醒我关注比赛" image:nil type:(HJSettingItemTypeArrow)  labelText:nil selected:^{
        
    }];
    HJSettingGroup *group = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item].mutableCopy footerTitle:@"当我关注的比赛比分发生变化的时候,通过小弹窗或者推送进行提醒~"];
    [self.dataList addObject:group];
}
- (void) addSecondSection  {
    HJSettingItem *item = [HJSettingItem settingItemWithTitle:@"开始时间" image:nil type:(HJSettingItemTypeLabel)  labelText:@"00:00" selected:^{
        
    }];
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"结束时间" image:nil type:(HJSettingItemTypeLabel)  labelText:@"23:59" selected:^{
        
    }];
    HJSettingGroup *group = [HJSettingGroup settingGroupWithHeaderTitle:@"只在以下的时间接受比分直播" items:@[item,item1].mutableCopy footerTitle:nil];
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
