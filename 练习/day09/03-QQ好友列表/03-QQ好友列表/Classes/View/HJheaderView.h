//
//  HJheaderView.h
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroupModel;

//typedef void(^headerBlock)(id object);

@interface HJheaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWith:(UITableView *)tableView;
@property (nonatomic, strong)FriendGroupModel  *model;
@property (nonatomic, copy)void(^headerBlock)(id object);
@end
