//
//  HJStatusCell.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/19.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJStatusFrame;
@interface HJStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)HJStatusFrame  *statusFrame;
@end
