//
//  ViewController.m
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroupModel.h"
#import "FriendsModel.h"
#import "HJheaderView.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray  *friendsArray;
@end

@implementation ViewController
- (NSMutableArray *)friendsArray {
    if (_friendsArray == nil) {
        _friendsArray = [FriendGroupModel friendGroups].mutableCopy;
    }
    return _friendsArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDataSource 和 UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendsArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FriendGroupModel *model = self.friendsArray[section];
    return model.open ? model.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identify];
    }
    FriendGroupModel *group = self.friendsArray[indexPath.section];
    FriendsModel *model = group.friends[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.intro;
    cell.imageView.image= [UIImage imageNamed:model.icon];
    cell.textLabel.textColor = model.vip ? [UIColor redColor] : [UIColor blackColor];
    return cell;
}
//header标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.friendsArray[section] name];
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //TODO:需要
    HJheaderView *headerView = [HJheaderView headerViewWith:tableView];
    //这里指向同一个指针, 所以在headerview中改变open值,再刷新就会变
    headerView.model = self.friendsArray[section];
    [headerView setHeaderBlock:^(id object) {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:(UITableViewRowAnimationNone)];
    }];
    return headerView;
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
