//
//  HJSettingCell.h
//  01-Lottery
//
//  Created by M-coppco on 16/4/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJSettingItem;
@interface HJSettingCell : UITableViewCell
@property (nonatomic, strong)HJSettingItem *settingItem;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
