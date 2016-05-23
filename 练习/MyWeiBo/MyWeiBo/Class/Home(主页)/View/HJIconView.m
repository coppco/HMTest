//
//  HJIconView.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/23.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJIconView.h"
#import "HJSinaUser.h"

@interface HJIconView ()
@property (nonatomic, strong)UIImageView  *iconV;
@end

@implementation HJIconView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.iconV = [[UIImageView alloc] init];
        [self addSubview:self.iconV];
    }
    return self;
}

- (void)setUser:(HJSinaUser *)user {
    _user = user;
    
    [self sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    //加V图片
    switch (user.verified_type) {
        case HJStatusVerifiedTypeNone :
            self.iconV.image = nil;
            self.iconV.hidden = YES;
            break;
        case  HJStatusVerifiedTypePerson : //个人
            self.iconV.image = [UIImage imageNamed:@"avatar_vip"];
            self.iconV.hidden = NO;
            break;
        case  HJStatusVerifiedTypeOrgEnterprice ://企业
        case  HJStatusVerifiedTypeOrgMedia ://媒体官方
        case  HJStatusVerifiedTypeWensite ://网站官方
            self.iconV.image = [UIImage imageNamed:@"avatar_enterprise_vip"];
            self.iconV.hidden = NO;
            break;
        case  HJStatusVerifiedTypeDaren ://微博达人
            self.iconV.image = [UIImage imageNamed:@"avatar_grassroot"];
            self.iconV.hidden = NO;
            break;
        default:
            self.iconV.image = nil;
            self.iconV.hidden = YES;
            break;
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconV.size = self.iconV.image.size;
    self.iconV.origin = CGPointMake(self.width - self.iconV.size.width * 0.7, self.height - self.iconV.size.height * 0.7);
}
@end
