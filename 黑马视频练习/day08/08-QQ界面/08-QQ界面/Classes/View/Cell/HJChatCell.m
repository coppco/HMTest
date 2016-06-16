//
//  HJChatCell.m
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJChatCell.h"
#import "HJMessageFrameModel.h"
#import "HJMessageModel.h"
@interface HJChatCell ()
@property (nonatomic, strong)UILabel  *time;
@property (nonatomic, strong)UIButton  *textView;
@property (nonatomic, strong)UIImageView  *icon;
@end

@implementation HJChatCell
+ (instancetype)chatCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"HJChatCell";
    HJChatCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //时间
        self.time = [[UILabel alloc] init];
        [self.contentView addSubview:self.time];
        
        //正文
        self.textView = [[UIButton alloc] init];
        self.textView.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.textView];
        
        //头像
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
    }
    return self;
}
- (void)setFrameMessage:(HJMessageFrameModel *)frameMessage {
    _frameMessage = frameMessage;
    //时间
    self.time.frame = frameMessage.timeF;
    self.time.text = frameMessage.message.time;
    //头像
    self.icon.frame = frameMessage.iconF;
    
    if (frameMessage.message.type == HJMessageTypeGatsby) {
        self.icon.image = [UIImage imageNamed:@"Gatsby"];
    } else {
        self.icon.image = [UIImage imageNamed:@"Jobs"];
    }
    
    //正文
    self.textView.frame = frameMessage.textF;
    [self.textView setTitle:frameMessage.message.text forState:(UIControlStateNormal)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
