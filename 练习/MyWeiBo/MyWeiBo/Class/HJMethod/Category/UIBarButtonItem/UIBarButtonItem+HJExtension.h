//
//  UIBarButtonItem+HJExtension.h
//  MyWeiBo
//
//  Created by M-coppco on 16/4/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HJExtension)
/**
 *  @author XHJ, 16-04-29 22:04:12
 *
 *  快速用按钮创建一个UIBarButtonItem对象
 *
 *  @param target       target-action的target
 *  @param action       target-action的action
 *  @param image        button的正常状态的图片
 *  @param hightlighted button的高亮状态的图片
 *
 *  @return 返回一个UIBarButtonItem对象
 */
+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target action:(SEL)action mage:(NSString *)image hightlighted:(NSString *)hightlighted;
@end
