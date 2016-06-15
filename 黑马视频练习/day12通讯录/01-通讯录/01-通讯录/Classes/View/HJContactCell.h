//
//  HJContactCell.h
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJContact;
@interface HJContactCell : UITableViewCell

+ (instancetype)contactCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)HJContact  *contact;
@end
