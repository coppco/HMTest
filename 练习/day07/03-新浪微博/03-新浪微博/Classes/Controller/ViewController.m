//
//  ViewController.m
//  03-新浪微博
//
//  Created by M-coppco on 16/3/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJStatus.h"
#import "HJStatusCell.h"
@interface ViewController ()
@property (nonatomic, strong)NSMutableArray  *statusArray;
@end

@implementation ViewController
- (NSMutableArray *)statusArray {
    if (_statusArray == nil) {
        _statusArray = [HJStatus statusArray].mutableCopy;
    }
    return _statusArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"HJStatusCell";
    HJStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[HJStatusCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identify];
    }
    HJStatus *status = self.statusArray[indexPath.row];
    cell.model= status;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //行高方法在加载cell之前,可以死根据status计算高度
    HJStatus *model = self.statusArray[indexPath.row];
    CGRect frame =  [model.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    CGFloat heig = 0;
    if (model.picture.length != 0) {
        heig = 10 + 100;
    }

    return 10 + 30 + 10 + frame.size.height + 10 + heig;
}
@end
