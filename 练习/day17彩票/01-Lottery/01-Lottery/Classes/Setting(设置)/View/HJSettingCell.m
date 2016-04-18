//
//  HJSettingCell.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJSettingCell.h"
#import "HJSettingItem.h"

@interface HJSettingCell ()
@property (nonatomic, strong)UISwitch *switchView; //开关
@property (nonatomic, strong)UIImageView *imageV; //图片
@end


@implementation HJSettingCell
//懒加载
- (UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}
- (UIImageView *)imageV {
    if (_imageV == nil) {
        _imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _imageV;
}
//setter方法
- (void)setSettingItem:(HJSettingItem *)settingItem {
    _settingItem = settingItem;
    
    //更新左侧
    [self updateLeft];
    
    //更新右侧
    [self updateAccessoryView];
}
//更新右侧的view
- (void)updateAccessoryView {
    switch (self.settingItem.type) {
        case HJSettingItemTypeArrow:
        {
            self.accessoryView = self.imageV;
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
            break;
        case HJSettingItemTypeSwitch:
        {
            self.accessoryView = self.switchView;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
        default:
        {
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
            break;
    }
}
- (void)updateLeft {
    self.textLabel.text = _settingItem.title;
    self.imageView.image = [UIImage imageNamed:_settingItem.image];
}
+ (instancetype)settingCellWithTableView:(UITableView *)tableView {
    static NSString *indentify = @"cell";
    HJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (!cell) {
        cell = [[HJSettingCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:indentify];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
