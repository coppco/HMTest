//
//  HJEmoticonPopView.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/30.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJEmoticon;
@interface HJEmoticonPopView : UIView
/**
 *  @author XHJ, 16-05-31 06:05:46
 *
 *  从xib加载图片
 *
 *  @return
 */
+ (instancetype)popView;
/**
 *  @author XHJ, 16-05-31 06:05:01
 *
 *  配置图片
 *
 *  @param emoticon 表情model
 */
- (void)configEmoticon:(HJEmoticon *)emoticon;
@end
