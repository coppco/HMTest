//
//  HJHomeViewController.m
//  MyWeiBo
//
//  Created by coco on 16/4/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJHomeViewController.h"
#import "KxMenu.h"
#import "HJTitleButton.h"
#import "HJSinaStatus.h"
#import "HJSinaUser.h"
#import "HJLoadMoreFooter.h"
#import "HJStatusFrame.h"
#import "HJStatusCell.h"

@interface HJHomeViewController ()
@property (nonatomic, strong)NSArray*menuArray;
/*微博数组,存放HJStatusFrame*/
@property (nonatomic, strong)NSMutableArray  *statuses;

@property (nonatomic, strong)UIRefreshControl  *control;
@end

@implementation HJHomeViewController
- (NSArray *)menuArray {
    if (_menuArray == nil) {
        _menuArray = @[
                       [KxMenuItem menuItem:@"应用" image:[UIImage imageNamed:@"app"] target:self action:nil],
                       [KxMenuItem menuItem:@"定位" image:[UIImage imageNamed:@"cast"] target:self action:nil],
                       [KxMenuItem menuItem:@"推广" image:[UIImage imageNamed:@"expand"] target:self action:nil],
                       [KxMenuItem menuItem:@"查找附近的人" image:[UIImage imageNamed:@"find_people"] target:self action:nil],
                       ];
    }
    return _menuArray;
}
- (NSMutableArray *)statuses {
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigation];
    self.tableView.backgroundColor = ColorFromRGB(211, 211, 211);
    //最上面显示灰色(10个距离)
    /**
     *  @author XHJ, 16-05-21 10:05:30
     *  首页里面的间隔设置: 把tableview设置一个背景颜色(颜色最深的211),  然后cell的backgroundcolor设置为clearcolor   然后原创微博设置为白色,转发微博设置为247,  cell的高度在多加上10(cell之间的)
     */
    //这种方法有弊端
    //self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    //self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    NSString *name = [HJAccountTool getAccount].name;
    name.length == 0 ?: [self setTitleViewWithTitle:name];
    [self getUserData];
    [self configDownRefresh];  //使用下拉刷新
    
    //上拉刷新
    [self configUpRefresh];  //使用下拉刷新
    
    // 获得未读数
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(setupUnreadCount) userInfo:nil repeats:YES];
    // 主线程也会抽时间处理一下timer（不管主线程是否正在其他事件）
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)configUpRefresh {
    HJLoadMoreFooter *footer = [HJLoadMoreFooter footer];
    footer.hidden = YES;
    self.tableView.tableFooterView = footer;
}
- (void)configDownRefresh {
    _control = [[UIRefreshControl alloc] init];
    [_control addTarget:self action:@selector(refresh:) forControlEvents:(UIControlEventValueChanged)];
    [self.tableView addSubview:_control];
    [_control beginRefreshing];//仅仅显示刷新状态,不会触事件
    [self refresh:_control];
}
- (void)refresh:(UIRefreshControl *)control {
    [self getFriends];
}
/*设置导航栏*/
- (void)navigation {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:nil mage:@"navigationbar_friendsearch" hightlighted:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:nil mage:@"navigationbar_pop" hightlighted:@"navigationbar_pop_highlighted"];
    
    HJTitleButton *button = [[HJTitleButton alloc] init];
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitle:@"首页" forState:(UIControlStateNormal)];
    button.titleLabel.font = [UIFont fontWithName:@"SnellRoundhand-Black" size:15];
    [button setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:(UIControlStateNormal)];
    
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:(UIControlStateSelected)];
    button.imageView.backgroundColor = nil;
//    CGFloat left = (button.imageView.width + button.titleLabel.width) * [UIScreen mainScreen].scale;  //要乘以像素
//    CGFloat right = button.imageView.width * [UIScreen mainScreen].scale;
//    /*调整按钮里面的文字和图片的位置*/
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, right); //参数里面是像素
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
    
    self.navigationItem.titleView = button;
}
/*获取用户数据*/
- (void)getUserData {
    
    HJAccount *account = [HJAccountTool getAccount];
    [HJHttpRequestTool requestWithType:(HJHttpRequestTypeGET) URLString:@"https://api.weibo.com/2/users/show.json" params:@{@"access_token":account.access_token, @"uid":account.uid} showHUD:NO progress:nil success:^(id response) {
        
        [self setTitleViewWithTitle:response[@"screen_name"]];
        
        //存储昵称到沙盒
        account.name = response[@"screen_name"];
        [HJAccountTool saveAccount:account];
    } failed:^(NSError *error) {
        
    }];
}
/*设置用户名*/
- (void)setTitleViewWithTitle:(NSString *)title {
    UIButton *bu = (UIButton *)self.navigationItem.titleView;
    [bu setTitle:title forState:(UIControlStateNormal)];
}
/*按钮点击方法*/
- (void)click:(UIButton *)button {
    button.selected = !button.selected;
    [KxMenu showMenuInView:[UIApplication sharedApplication].windows.lastObject fromRect:CGRectMake(button.centerX, button.y + 60, 0, 0) menuItems:self.menuArray];
}
/*获取最新微博接口*/
- (void)getFriends {
    NSMutableDictionary *dic = @{@"access_token":[HJAccountTool getAccount].access_token, @"count" : @20}.mutableCopy;
    //加载最新的
    HJStatusFrame *statusF = [self.statuses firstObject];
    if (statusF) {
        dic[@"since_id"] = statusF.status.idstr;
    }

    [HJHttpRequestTool requestWithType:(HJHttpRequestTypeGET) URLString:kSinaFriends params:dic showHUD:NO progress:nil success:^(id response) {
        XHJLog(@"%@", response);
        [_control endRefreshing];
        NSArray *array = [HJSinaStatus arrayOfModelsFromDictionaries:response[@"statuses"]];
        //这里提示一下
        [self showStatusCount:array.count];
        
        NSMutableArray *statusM = [NSMutableArray array];
        for (HJSinaStatus *status in array) {
            HJStatusFrame *statusF = [[HJStatusFrame alloc] init];
            statusF.status = status;
            [statusM addObject:statusF];
        }
        
        //把数据插入到前面
        [self.statuses insertObjects:statusM atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statusM.count)]];
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        [_control endRefreshing];
        XHJLog(@"%@", error);
    }];
}

- (void)showStatusCount:(NSInteger)count {
    
    //刷新成功清除角标
    self.tabBarItem.badgeValue = nil;
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    UILabel *label = [[UILabel alloc] init];
    label.height = 35;
    label.width = KMainScreenWidth;
    
    NSString *string = count == 0 ? @"没有新的微博数据,稍后再试" : [NSString stringWithFormat:@"共有%d条新的微博数据", count];
    label.text = string;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.textAlignment = 1;
    label.alpha = 0;
    label.y = 64 - label.height;
    
    //添加到导航栏控制器的view上面
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    //动画
    [UIView animateWithDuration:1.0 animations:^{
//        label.y = 64;
        label.transform = CGAffineTransformMakeTranslation(0, label.height);
        label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.0 options:(UIViewAnimationOptionAllowAnimatedContent) animations:^{
//            label.y = 64 - label.height;
            label.transform = CGAffineTransformIdentity; //取消形变
            label.alpha = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//获取未读微博数
- (void)setupUnreadCount {
    // 2.拼接请求参数
    HJAccount *account = [HJAccountTool getAccount];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    [HJHttpRequestTool requestWithType:(HJHttpRequestTypeGET) URLString:@"https://rm.api.weibo.com/2/remind/unread_count.json" params:params showHUD:NO progress:nil success:^(id response) {
        NSString *status = [response[@"status"] description];

        if ([status isEqualToString:@"0"]) { // 如果是0，得清空数字
            self.tabBarItem.badgeValue = nil; //设置tabbaritem的角标
            [UIApplication sharedApplication].applicationIconBadgeNumber = 0; //程序角标
        } else { // 非0情况
            self.tabBarItem.badgeValue = status;
            [UIApplication sharedApplication].applicationIconBadgeNumber = status.intValue;
        }
    } failed:^(NSError *error) {
        
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HJStatusCell *cell = [HJStatusCell cellWithTableView:tableView];
    HJStatusFrame *statusF = self.statuses[indexPath.row];
    cell.statusFrame = statusF;
    return cell;
}
//上啦刷新
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    scrollView == self.tableView == self.view
    // 如果tableView还没有数据，就直接返回
    if (self.statuses.count == 0 || self.tableView.tableFooterView.isHidden == NO) return;
    
    CGFloat offsetY = scrollView.contentOffset.y;
    // 当最后一个cell完全显示在眼前时，contentOffset的y值
    CGFloat judgeOffsetY = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.height - self.tableView.tableFooterView.height;
    if (offsetY >= judgeOffsetY) { // 最后一个cell完全进入视野范围内
        // 显示footer
        self.tableView.tableFooterView.hidden = NO;
        
        // 加载更多的微博数据
        [self loadMoreStatus];
        //这里有一个bug 就是cell数量不多的时候回自动加载更多数据
    }
}
- (void)loadMoreStatus {
    // 2.拼接请求参数
    HJAccount *account = [HJAccountTool getAccount];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    HJStatusFrame *lastStatusF = [self.statuses lastObject];
    if (lastStatusF) {
        // 若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
        // id这种数据一般都是比较大的，一般转成整数的话，最好是long long类型
        long long maxId = lastStatusF.status.idstr.longLongValue - 1;
        params[@"max_id"] = @(maxId);
    }
    
    [HJHttpRequestTool requestWithType:(HJHttpRequestTypeGET) URLString:@"https://api.weibo.com/2/statuses/friends_timeline.json" params:params showHUD:NO progress:nil success:^(id response) {
        
        NSArray *newStatuses = [HJSinaStatus arrayOfModelsFromDictionaries:response[@"statuses"]];
        NSMutableArray *statusM = [NSMutableArray array];
        for (HJSinaStatus *status in newStatuses) {
            HJStatusFrame *statusF = [[HJStatusFrame alloc] init];
            statusF.status = status;
            [statusM addObject:statusF];
        }
        
        // 将更多的微博数据，添加到总数组的最后面
        [self.statuses addObjectsFromArray:statusM];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新(隐藏footer)
        self.tableView.tableFooterView.hidden = YES;
    } failed:^(NSError *error) {
        self.tableView.tableFooterView.hidden = YES;
    }];
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.statuses[indexPath.row] cellHeight];
}
@end
