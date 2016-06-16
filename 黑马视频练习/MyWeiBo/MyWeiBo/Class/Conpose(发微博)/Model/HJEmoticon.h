//
//  HJEmoticon.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//  表情

#import <JSONModel/JSONModel.h>

@interface HJEmoticon : JSONModel
//Default和浪小花
/**中文名字*/
@property (nonatomic, copy)NSString <Optional>*chs;
/**繁体名字*/
@property (nonatomic, copy)NSString <Optional>*cht;
/**gif*/
@property (nonatomic, copy)NSString <Optional>*gif;
/**png*/
@property (nonatomic, copy)NSString <Optional>*png;


//Emoji表情
/**16进制表情*/
@property (nonatomic, copy)NSString <Optional>*code;
/**type*/
@property (nonatomic, copy)NSString <Optional>*type;
@end
