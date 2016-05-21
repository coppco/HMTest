//
//  HJPhoto.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/20.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HJPhoto
@end

@interface HJPhoto : JSONModel
/**缩略图thumbnail_pic*/
@property (nonatomic, copy)NSString *thumbnail_pic;
@end
