//
//  HJBaseTableViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJBaseTableViewController.h"
#import "HJSettingCell.h"
#import "HJSettingItem.h"   //模型

@interface HJBaseTableViewController ()

@end

@implementation HJBaseTableViewController
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    HJSettingGroup *group = self.dataList[section];
    return group.footerTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HJSettingGroup *group = self.dataList[section];
    return group.headerTitle;
}
@end
