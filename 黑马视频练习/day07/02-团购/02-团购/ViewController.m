//
//  ViewController.m
//  02-团购
//
//  Created by M-coppco on 16/3/9.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJTGCell.h"
#import "HJTG.h"
#import "HJTGFooterView.h"
@interface ViewController ()
@property (nonatomic, strong)NSMutableArray  *array;
@end

@implementation ViewController
- (NSMutableArray *)array {
    if (_array == nil) {
        _array = [HJTG tgArray].mutableCopy;
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    //调整布局
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    
    
    //footerview  和  headerView  宽度和表格一样 只需指定高度
    HJTGFooterView *view = [[[NSBundle mainBundle] loadNibNamed:@"HJTGFooterView" owner:nil options:nil] lastObject];
    [view setClickBlock:^{
        //延迟操作
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.array addObjectsFromArray:self.array];
            [self.tableView reloadData];
            //结束刷新
            [view endRefresh];
        });
    }];
    self.tableView.tableFooterView = view;
    self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"HJTGHeaderView" owner:nil options:nil] lastObject];
}
/**
 *  隐藏状态栏
 */
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //使用xib创建自定义cell,  在xib中设置重用标识符
    static NSString *identify = @"cell";
    HJTGCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        NSLog(@"加载xib");
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HJTGCell" owner:nil options:nil] lastObject];
    }
    HJTG *tg = self.array[indexPath.row];
    cell.model = tg;
    return cell;
}

@end
