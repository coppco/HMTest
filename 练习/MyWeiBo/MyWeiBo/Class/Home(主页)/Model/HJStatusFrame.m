//
//  HJStatusFrame.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/20.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJStatusFrame.h"
#import "HJSinaUser.h"
#import "HJSinaStatus.h"
#define HJStatusIconWidthAndHeight 50
#define HJStatusCellBorderW 10
#define HJStatusPhotoWH 70

@implementation HJStatusFrame
- (CGSize)sizeForString:(NSString *)str font:(UIFont *)font {
    return [self sizeForString:str font:font maxWidth:0];
}
- (CGSize)sizeForString:(NSString *)str font:(UIFont *)font maxWidth:(CGFloat)width {
    return [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size;
}
//获取配图的尺寸
- (CGSize)sizeOfPhotoView:(NSInteger)count {
    CGFloat photosW = KMainScreenWidth - 2 * HJStatusCellBorderW;
    if (count != 1 && count != 4) {
        //    NSInteger row = count / 3 == 0 ? count / 3 : count / 3 + 1;
        NSInteger row = (count + 3 - 1) / 3; //计算行数(分页)的公式
        //(总数 + 每页最大行数 - 1 ) / 每页最大行数
        //    NSInteger colum = count > 2 ? 3 : count; //列
        
        CGFloat photosH = row * (photosW - 2 * HJStatusCellBorderW) / 3 + (row - 1) * HJStatusCellBorderW;
        return CGSizeMake(photosW, photosH);
    } else {
        return CGSizeMake(photosW, photosW);
    }
}
//getter方法 解决时间长度变化 长度变化
- (CGRect)timeF {
    CGSize timeSize = [self sizeForString:_status.created_at font:HJStatusCellTimeFont];
    return CGRectMake(self.nameF.origin.x, CGRectGetMaxY(self.nameF) + HJStatusCellBorderW, timeSize.width, timeSize.height);//在getter方法中加上这句
}
- (CGRect)sourceF {
    CGSize sourceSize = [self sizeForString:_status.source font:HJStatusCellSourceFont];
    return CGRectMake(CGRectGetMaxX(self.timeF) + HJStatusCellBorderW, self.timeF.origin.y, sourceSize.width, sourceSize.height);
}
- (void)setStatus:(HJSinaStatus *)status {
    _status = status;
    HJSinaUser *user = status.user;
    /*头像*/
    self.iconImageF = CGRectMake(HJStatusCellBorderW, HJStatusCellBorderW, HJStatusIconWidthAndHeight, HJStatusIconWidthAndHeight);
  
     /*名称*/
    CGSize size = [self sizeForString:user.name font:HJStatusCellNameFont];

    self.nameF = CGRectMake(CGRectGetMaxX(self.iconImageF) + HJStatusCellBorderW, self.iconImageF.origin.y, size.width, size.height);
    /*VIP*/
    if (user.isVip) {
        self.vipImageF = CGRectMake(CGRectGetMaxX(self.nameF) + HJStatusCellBorderW, self.nameF.origin.y, 14, size.height);
    }
    
    /*时间*/
    CGSize timeSize = [self sizeForString:status.created_at font:HJStatusCellTimeFont];
    self.timeF = CGRectMake(self.nameF.origin.x, CGRectGetMaxY(self.nameF) + HJStatusCellBorderW, timeSize.width, timeSize.height);//在getter方法中加上这句
    /*来源*/
    CGSize sourceSize = [self sizeForString:status.source font:HJStatusCellSourceFont];
    self.sourceF = CGRectMake(CGRectGetMaxX(self.timeF) + HJStatusCellBorderW, self.timeF.origin.y, sourceSize.width, sourceSize.height);

    /*正文*/

    CGSize contentFrame = [self sizeForString:status.text font:HJStatusCellContentFont maxWidth:KMainScreenWidth - 2 * HJStatusCellBorderW];
    self.contentF = CGRectMake(HJStatusCellBorderW, MAX(CGRectGetMaxY(self.timeF), CGRectGetMaxY(self.iconImageF)) + HJStatusCellBorderW, KMainScreenWidth - 2 * HJStatusCellBorderW, contentFrame.height);
    
     /*配图*/
    if (status.pic_urls.count != 0) {
        CGSize size = [self sizeOfPhotoView:status.pic_urls.count];
        self.photoImageF = CGRectMake(HJStatusCellBorderW, CGRectGetMaxY(self.contentF) + HJStatusCellBorderW, size.width, size.height);
    }
    /*原创微博整体*/
    self.originalF = CGRectMake(0, 15, KMainScreenWidth, MAX(CGRectGetMaxY(self.contentF), CGRectGetMaxY(self.photoImageF)) + HJStatusCellBorderW);
    
    //被转发微博
    if (status.retweeted_status) {
        //转发微博昵称和内容
        CGSize reweetLF = [self sizeForString:STR(@"@%@:%@", status.retweeted_status.user.name, status.retweeted_status.text) font:HJStatusCellRetweetContentFont maxWidth:KMainScreenWidth - 2 * HJStatusCellBorderW];
        self.retweetLabelF = CGRectMake(HJStatusCellBorderW, HJStatusCellBorderW, reweetLF.width, reweetLF.height);
        
        //转发微博配图
        if (status.retweeted_status.pic_urls.count != 0) {
             CGSize size = [self sizeOfPhotoView:status.retweeted_status.pic_urls.count];
            self.retweetPhotoImageVF = CGRectMake(HJStatusCellBorderW, CGRectGetMaxY(self.retweetLabelF) + HJStatusCellBorderW, size.width, size.height);
        }
        
        //整体
        self.retweetViewF = CGRectMake(0, CGRectGetMaxY(self.originalF), KMainScreenWidth, MAX(CGRectGetMaxY(self.retweetLabelF), CGRectGetMaxY(self.retweetPhotoImageVF) + HJStatusCellBorderW));
    }
    
    self.toolBarF = CGRectMake(0, MAX(CGRectGetMaxY(self.originalF) , CGRectGetMaxY(self.retweetViewF)) + 1, KMainScreenWidth, 40);
    
    /*cell的高度*/
    self.cellHeight = CGRectGetMaxY(self.toolBarF);
}
@end
