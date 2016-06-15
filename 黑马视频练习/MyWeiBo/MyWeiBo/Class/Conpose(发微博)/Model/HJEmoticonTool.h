//
//  HJEmoticonTool.h
//  MyWeiBo
//
//  Created by M-coppco on 16/6/1.
//  Copyright © 2016年 XHJ. All rights reserved.
//  工具类  保存取最近表情

#import <Foundation/Foundation.h>

@class HJEmoticon;
@interface HJEmoticonTool : NSObject

+ (void)addEmoticon:(HJEmoticon *)emoticon;

+ (NSArray *)recentEmoticons;
@end
