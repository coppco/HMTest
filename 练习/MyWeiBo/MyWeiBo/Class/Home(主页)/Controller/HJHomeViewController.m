//
//  HJHomeViewController.m
//  MyWeiBo
//
//  Created by coco on 16/4/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJHomeViewController.h"
#import "KxMenu.h"

@interface HJHomeViewController ()
@property (nonatomic, strong)NSArray*menuArray;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigation];
    NSString *name = [HJAccountTool getAccount].name;
    name.length != 0 ? [self setTitleViewWithTitle:name] : [self getUserData];
}
/*设置导航栏*/
- (void)navigation {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:nil mage:@"navigationbar_friendsearch" hightlighted:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:nil mage:@"navigationbar_pop" hightlighted:@"navigationbar_pop_highlighted"];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.size = CGSizeMake(150, 30);
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitle:@"Coppco" forState:(UIControlStateNormal)];
    button.titleLabel.font = [UIFont fontWithName:@"SnellRoundhand-Black" size:15];
    [button setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:(UIControlStateNormal)];
    
    //    button.titleLabel.backgroundColor = [UIColor greenColor];
    //    button.imageView.backgroundColor = [UIColor blueColor];
    /*调整按钮里面的文字和图片的位置*/
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 120, 0, 0);
    
    self.navigationItem.titleView = button;
}
/*获取用户数据*/
- (void)getUserData {
    
    HJAccount *account = [HJAccountTool getAccount];
    [HJHttpRequestTool requestWithType:(HJHttpRequestTypeGET) URLString:@"https://api.weibo.com/2/users/show.json" params:@{@"access_token":account.access_token, @"uid":account.uid} showHUD:NO progress:nil success:^(id response) {
        [self setTitleViewWithTitle:response[@"screen_name"]];
        //存储昵称到沙盒
        XHJLog(@"%@", response[@"screen_name"]);
        account.name = response[@"screen_name"];
        [HJAccountTool saveAccount:account];
    } failed:^(NSError *error) {
        
    }];
}
- (void)setTitleViewWithTitle:(NSString *)title {
    UIButton *bu = (UIButton *)self.navigationItem.titleView;
    [bu setTitle:title forState:(UIControlStateNormal)];
}
- (void)click:(UIButton *)button {
    [KxMenu showMenuInView:[UIApplication sharedApplication].windows.lastObject fromRect:CGRectMake(button.centerX, button.y + 60, 0, 0) menuItems:self.menuArray];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
