//
//  HJEmoticonKeyboard.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/28.
//  Copyright © 2016年 XHJ. All rights reserved.
//  表情键盘

#import <UIKit/UIKit.h>
@class HJEmoticon;
@interface HJEmoticonKeyboard : UIView
/**emoticon点击block*/
@property (nonatomic, copy)void (^buttonClick)(HJEmoticon *emoticon);
@end
