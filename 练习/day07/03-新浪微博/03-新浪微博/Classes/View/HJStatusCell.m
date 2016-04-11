//
//  HJStatusCell.m
//  03-新浪微博
//
//  Created by M-coppco on 16/3/11.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJStatusCell.h"
#import "HJStatus.h"

#define kNameFont [UIFont systemFontOfSize:14]
#define kTextFont [UIFont systemFontOfSize:16]
@interface HJStatusCell ()
@property (nonatomic, strong)UIImageView  *iconV;
@property (nonatomic, strong)UILabel  *nameL;
@property (nonatomic, strong)UIImageView  *vipV;
@property (nonatomic, strong)UILabel  *textL;
@property (nonatomic, strong)UIImageView  *pictureV;
@end

@implementation HJStatusCell
- (UIImageView *)iconV {
    if (_iconV == nil) {
        _iconV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconV];
    }
    return _iconV;
}
- (UILabel *)nameL {
    if (_nameL == nil) {
        _nameL = [[UILabel alloc] init];
        _nameL.font = kNameFont;
        [self.contentView addSubview:_nameL];
    }
    return _nameL;
}
- (UIImageView *)vipV {
    if (_vipV == nil) {
        _vipV = [[UIImageView alloc] init];
        _vipV.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:_vipV];
    }
    return _vipV;
}
- (UIImageView *)pictureV {
    if (_pictureV == nil) {
        _pictureV = [[UIImageView alloc] init];
        [self.contentView addSubview:_pictureV];
    }
    return _pictureV;
}
- (UILabel *)textL {
    if (_textL == nil) {
        _textL = [[UILabel alloc] init];
        _textL.font = kTextFont;
        _textL.numberOfLines = 0;  //换行
        [self.contentView addSubview:_textL];
    }
    return _textL;
}
- (void)setModel:(HJStatus *)model {
    _model = model;
    
    //设置数据
    [self setData];
    //设置位置
    [self setFrame];
}
/**
 *  设置数据
 */
- (void)setData {
    self.iconV.image = [UIImage imageNamed:self.model.icon];
    self.nameL.text = self.model.name;
    if (self.model.vip) {
        self.vipV.hidden = NO;
        self.nameL.textColor = [UIColor redColor];
    } else {
        self.vipV.hidden = YES;
        self.nameL.textColor = [UIColor blackColor];
    }
    self.textL.text = self.model.text;
    if (self.model.picture.length != 0) {
        self.pictureV.image = [UIImage imageNamed:self.model.picture];
    } else {
        self.pictureV.image = nil;
    }
}
/**
 *  设置位置
 */
- (void)setFrame {
    CGFloat padding = 10;
    self.iconV.frame = CGRectMake(padding, padding, 30, 30);
    
    CGRect frame = [self.model.name boundingRectWithSize:CGSizeMake(10000, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:kNameFont} context:nil];
    self.nameL.frame = CGRectMake(CGRectGetMaxX(self.iconV.frame) + padding, padding + (self.iconV.frame.size.height - frame.size.height) * 0.5, frame.size.width, frame.size.height);
    
    self.vipV.frame = CGRectMake(CGRectGetMaxX(self.nameL.frame) + padding, self.nameL.frame.origin.y, 14, 14);
    
    CGRect frame1 = [self.model.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:kTextFont} context:nil];
    self.textL.frame = CGRectMake(padding, CGRectGetMaxY(self.iconV.frame) + padding, frame1.size.width, frame1.size.height);
    if (self.model.picture.length != 0) {
        self.pictureV.frame = CGRectMake(padding, CGRectGetMaxY(self.textL.frame) + padding, 100, 100);
    }
}
@end
