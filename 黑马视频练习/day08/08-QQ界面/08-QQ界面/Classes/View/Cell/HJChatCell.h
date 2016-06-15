//
//  HJChatCell.h
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJMessageFrameModel;
@interface HJChatCell : UITableViewCell
+ (instancetype)chatCellWithTableView:(UITableView *)tableView;
//frame模型
@property (nonatomic, strong)HJMessageFrameModel  *frameMessage;
@end
