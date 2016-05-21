//
//  HJStatusFrame.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/20.
//  Copyright © 2016年 XHJ. All rights reserved.
//ss
#import <Foundation/Foundation.h>

/*名称*/
#define HJStatusCellNameFont [UIFont systemFontOfSize:15]
/*时间字体*/
#define HJStatusCellTimeFont [UIFont systemFontOfSize:13]
/*来源字体*/
#define HJStatusCellSourceFont [UIFont systemFontOfSize:13]
/*正文字体*/
#define HJStatusCellContentFont [UIFont systemFontOfSize:13]
/*转发微博正文字体*/
#define HJStatusCellRetweetContentFont [UIFont systemFontOfSize:13]
@class HJSinaStatus;
@interface HJStatusFrame : NSObject

@property (nonatomic, strong)HJSinaStatus  *status;
/**原创微博整体*/
@property (nonatomic, assign)CGRect originalF;
/**头像*/
@property (nonatomic, assign)CGRect  iconImageF;
/**配图*/
@property (nonatomic, assign)CGRect  photoImageF;
/**VIP*/
@property (nonatomic, assign)CGRect  vipImageF;
/**名称*/
@property (nonatomic, assign)CGRect  nameF;
/**时间*/
@property (nonatomic, assign)CGRect  timeF;
/**来源*/
@property (nonatomic, assign)CGRect  sourceF;
/**正文*/
@property (nonatomic, assign)CGRect  contentF;

/**转发微博整体*/
@property (nonatomic, assign)CGRect  retweetViewF;
/**转发微博正文 + 昵称*/
@property (nonatomic, assign)CGRect  retweetLabelF;
/**转发微博配图*/
@property (nonatomic, assign)CGRect  retweetPhotoImageVF;

/**工具条*/
@property (nonatomic, assign)CGRect  toolBarF;

/**cell高度*/
@property (nonatomic, assign)CGFloat  cellHeight;
@end
