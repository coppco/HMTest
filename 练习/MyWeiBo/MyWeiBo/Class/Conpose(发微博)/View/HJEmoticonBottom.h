//
//  HJEmoticonBottom.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/28.
//  Copyright © 2016年 XHJ. All rights reserved.
//   键盘底部的工具栏

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HJEmoticonBottomType) {
    HJEmoticonBottomTypeRecently = 0, //最近
    HJEmoticonBottomTypeDefault,   //默认
    HJEmoticonBottomTypeEmoji, //Emoji
    HJEmoticonBottomTypeSina  //浪小花
};
@interface HJEmoticonBottom : UIView
/**点击button方法*/
@property (nonatomic, copy)void (^buttonClick)(HJEmoticonBottomType type);
@end
