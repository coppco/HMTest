//
//  HJContactCell.m
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJContactCell.h"
#import "HJContact.h"
@implementation HJContactCell

- (void)setContact:(HJContact *)contact {
    _contact = contact;
    self.detailTextLabel.text = contact.phone;
    self.textLabel.text = contact.name;
}

+ (instancetype)contactCellWithTableView:(UITableView *)tableView {
    HJContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
