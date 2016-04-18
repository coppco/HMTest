//
//  HJSettingTableViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/15.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJSettingTableViewController.h"
#import "HJSettingItem.h"   //模型
#import "HJSettingCell.h"
#import "MBProgressHUD+MJ.h"
#import "HJProducCollectionViewController.h"
@interface HJSettingTableViewController ()
@property (nonatomic, strong)NSMutableArray *dataList;
@end

@implementation HJSettingTableViewController
//懒加载
- (NSMutableArray *)dataList {
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
- (instancetype)init {
    self = [super initWithStyle:(UITableViewStyleGrouped)];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self addFirstSection];
    [self addSecondSection];
}
- (void)addFirstSection {
    //推送提醒
    HJSettingItem *item = [HJSettingItem settingItemWithTitle:@"推送和提醒" image:@"MorePush" type:(HJSettingItemTypeArrow) selected:^() {
        
    }];
    //摇一摇
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"摇一摇" image:@"handShake" type:(HJSettingItemTypeSwitch) selected:^() {
        
    }];
    //声音效果
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"声音效果" image:@"sound_Effect" type:(HJSettingItemTypeSwitch) selected:^() {
        
    }];
    HJSettingGroup *group1 = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item,item1,item2].mutableCopy footerTitle:@""];
    [self.dataList addObject:group1];
}
- (void)addSecondSection {
    //检查最新版本
    HJSettingItem *item = [HJSettingItem settingItemWithTitle:@"检查最新版本" image:@"MoreUpdate" type:(HJSettingItemTypeArrow) selected:^() {
        [MBProgressHUD showMessage:@"正在加载"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您的版本已经是最新版本" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        });
    }];
    //帮助
    HJSettingItem *item1 = [HJSettingItem settingItemWithTitle:@"帮助" image:@"MoreHelp" type:(HJSettingItemTypeArrow) selected:^() {
        
    }];
    //分享
    HJSettingItem *item2 = [HJSettingItem settingItemWithTitle:@"分享" image:@"MoreShare" type:(HJSettingItemTypeArrow) selected:^() {
        
    }];
    //查看消息
    HJSettingItem *item3 = [HJSettingItem settingItemWithTitle:@"查看消息" image:@"MoreMessage" type:(HJSettingItemTypeArrow) selected:^() {
        
    }];
    //产品推广
    HJSettingItem *item4 = [HJSettingItem settingItemWithTitle:@"产品推广" image:@"MoreNetease" type:(HJSettingItemTypeArrow) selected:^() {
        HJProducCollectionViewController *productVC = [[HJProducCollectionViewController alloc] init];
        [self.navigationController pushViewController:productVC animated:YES];
    }];
    //关于
    HJSettingItem *item5 = [HJSettingItem settingItemWithTitle:@"关于" image:@"MoreAbout" type:(HJSettingItemTypeArrow) selected:^() {
        
    }];
    HJSettingGroup *group2 = [HJSettingGroup settingGroupWithHeaderTitle:@"" items:@[item,item1,item2,item3,item4,item5].mutableCopy footerTitle:@""];
    [self.dataList addObject:group2];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HJSettingGroup *group = self.dataList[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HJSettingCell *cell = [HJSettingCell settingCellWithTableView:tableView];
    HJSettingGroup *group = self.dataList[indexPath.section];
    cell.settingItem = group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //取消选中
    HJSettingGroup *group = self.dataList[indexPath.section];
    HJSettingItem *item = group.items[indexPath.row];
    if (item.selected) {
        item.selected();
    }
}

@end
