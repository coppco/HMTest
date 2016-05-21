//
//  HJStatusCell.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/19.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJStatusCell.h"
#import "HJStatusFrame.h"
#import "HJSinaStatus.h"
#import "HJSinaUser.h"
#import "HJStatusToolBar.h"
#import "HJStatusPhotoView.h"  //配图
@interface HJStatusCell ()
/*原创微博整体*/
@property (nonatomic, strong)UIView  *originalView;
/*头像*/
@property (nonatomic, strong)UIImageView  *iconImageV;
/*配图*/
@property (nonatomic, strong)HJStatusPhotoView  *photoImageV;
/*VIP*/
@property (nonatomic, strong)UIImageView  *vipImageV;
/*名称*/
@property (nonatomic, strong)UILabel  *nameLabel;
/*时间*/
@property (nonatomic, strong)UILabel  *timeLabel;
/*来源*/
@property (nonatomic, strong)UILabel  *sourceLabel;
/*正文*/
@property (nonatomic, strong)UILabel  *contentLabel;

/*转发微博整体*/
@property (nonatomic, strong)UIView  *retweetView;
/*转发微博正文 + 昵称*/
@property (nonatomic, strong)UILabel  *retweetLabel;
/*转发微博配图*/
@property (nonatomic, strong)HJStatusPhotoView  *retweetPhotoImageV;

/**工具条*/
@property (nonatomic, strong)HJStatusToolBar  *toolBar;
@end

@implementation HJStatusCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"HJStatusCell";
    HJStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HJStatusCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ID];
    }
    return cell;
}
/**
 *  @author XHJ, 16-05-19 22:05:52
 *
 *  初始化方法,一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件  以及子控件的一次性设置
 *  @return
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;//选中颜色
        self.backgroundColor = [UIColor clearColor];
        [self  initOriginal]; //初始化原创微博
        [self initReweet]; //初始化转发微博
        [self initToolBar]; //工具条
    }
    return self;
}
- (void)initToolBar {
    self.toolBar = [HJStatusToolBar toolBar];
    [self.contentView addSubview:self.toolBar];
}
- (void)initOriginal{
    // code
    /*原创微博整体*/
    self.originalView = [[UIView alloc] init];
    self.originalView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.originalView];
    /*头像*/
    self.iconImageV = [[UIImageView alloc] init];
    [self.originalView addSubview:self.iconImageV];
    /*配图*/
    self.photoImageV = [[HJStatusPhotoView alloc] init];
    [self.originalView addSubview:self.photoImageV];
    /*VIP*/
    self.vipImageV = [[UIImageView alloc] init];
    self.vipImageV.contentMode = UIViewContentModeCenter;//居中
    [self.originalView addSubview:self.vipImageV];
    /*名称*/
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = HJStatusCellNameFont;
    [self.originalView addSubview:self.nameLabel];
    /*时间*/
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = HJStatusCellTimeFont;
    [self.originalView addSubview:self.timeLabel];
    /*来源*/
    self.sourceLabel = [[UILabel alloc] init];
    self.sourceLabel.font = HJStatusCellSourceFont;
    [self.originalView addSubview:self.sourceLabel];
    /*正文*/
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0; //自动换行
    self.contentLabel.font = HJStatusCellContentFont;
    [self.originalView addSubview:self.contentLabel];
}
- (void)initReweet {
    /*转发微博整体*/
    self.retweetView = [[UIView alloc] init];
    self.retweetView.backgroundColor = ColorFromRGB(247, 247, 247);
    [self.contentView addSubview:self.retweetView];
    /*转发微博正文 + 昵称*/
    self.retweetLabel = [[UILabel alloc] init];
    self.retweetLabel.numberOfLines = 0;
    [self.retweetView addSubview:self.retweetLabel];
    /*转发微博配图*/
    self.retweetPhotoImageV = [[HJStatusPhotoView alloc] init];
    [self.retweetView addSubview:self.retweetPhotoImageV];
}
- (void)setStatusFrame:(HJStatusFrame *)statusFrame {
    _statusFrame = statusFrame;
    
    HJSinaStatus *status = statusFrame.status;
    HJSinaUser *user = statusFrame.status.user;
    //设置属性
    self.originalView.frame = statusFrame.originalF;

    
    //头像
    self.iconImageV.frame = statusFrame.iconImageF;
    [self.iconImageV sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    /*VIP*/
    self.vipImageV.frame = statusFrame.vipImageF;
    
    if ([user.isVip boolValue]) {
        self.vipImageV.image = [UIImage imageNamed:STR(@"common_icon_membership_level%d", user.mbrank)];
        self.vipImageV.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageV.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    /*配图*/
    if (status.pic_urls.count != 0) {
        self.photoImageV.photoes = status.pic_urls;
        self.photoImageV.frame = statusFrame.photoImageF;
        self.photoImageV.hidden = NO;
    } else {
        self.photoImageV.frame = CGRectZero;
        self.photoImageV.hidden = YES;
        self.photoImageV.photoes = nil;
    }
    
    /*名称*/
    self.nameLabel.text = user.name;
    self.nameLabel.frame = statusFrame.nameF;
    /*时间*/
    self.timeLabel.text = status.created_at;
    self.timeLabel.frame = statusFrame.timeF;
    /*来源*/
    self.sourceLabel.text = status.source;
    self.sourceLabel.frame = statusFrame.sourceF;
    /*正文*/
    self.contentLabel.text = status.text;
    self.contentLabel.frame = statusFrame.contentF;
    
    //转发微博
    if (status.retweeted_status) {
        HJSinaStatus *retweetStatus = status.retweeted_status;
        self.retweetView.hidden = NO;
        self.retweetView.frame = statusFrame.retweetViewF;
    
        self.retweetLabel.hidden = NO;
        self.retweetLabel.frame = statusFrame.retweetLabelF;
        self.retweetLabel.font = HJStatusCellRetweetContentFont;
        self.retweetLabel.text = STR(@"@%@:%@", retweetStatus.user.name, retweetStatus.text);
        
        //转发微博配图
        if (status.retweeted_status.pic_urls.count != 0) {
            self.retweetPhotoImageV.hidden = NO;
            self.retweetPhotoImageV.frame = statusFrame.retweetPhotoImageVF;
            self.retweetPhotoImageV.photoes = status.retweeted_status.pic_urls;
        } else {
            self.retweetPhotoImageV.hidden = YES;
            self.retweetPhotoImageV.frame = CGRectZero;
            self.retweetPhotoImageV.photoes = nil;
        }
    } else {
        self.retweetView.hidden = YES;
        self.retweetLabel.hidden = YES;
        self.retweetPhotoImageV.hidden = YES;
    }
    
    //工具条
    self.toolBar.frame = statusFrame.toolBarF;
    [self.toolBar configButtonWithStatus:status];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
