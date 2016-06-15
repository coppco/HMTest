//
//  HJEmoticonListView.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/28.
//  Copyright © 2016年 XHJ. All rights reserved.
//  表情键盘内容

#import <UIKit/UIKit.h>
@class HJEmoticon;
@interface HJEmoticonListView : UIView
/**点击的block*/
@property (nonatomic, copy)void (^emoticonHasClick)(HJEmoticon *emoticon);
/**表情数组*/
@property (nonatomic, strong)NSArray  *emoticons;
@end
