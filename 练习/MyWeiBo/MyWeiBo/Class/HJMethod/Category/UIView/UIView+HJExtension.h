//
//  UIView+Frame.h
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//   给UIView添加了常用的属性获取和设置方法

#import <UIKit/UIKit.h>

@interface UIView (HJExtension)

/*==============属性可以设置也可以获取================*/
/*x*/
@property (nonatomic, assign)CGFloat x;

/*y*/
@property (nonatomic, assign)CGFloat y;

/*宽*/
@property (nonatomic, assign)CGFloat width;

/*高*/
@property (nonatomic, assign)CGFloat height;

/*中心点X*/
@property (nonatomic, assign)CGFloat centerX;

/*中心点Y*/
@property (nonatomic, assign)CGFloat centerY;

/*原点*/
@property (nonatomic, assign)CGPoint origin;

/*size*/
@property (nonatomic, assign)CGSize size;

/*==============属性只可以获取================*/

/*最左边x = x*/
@property (nonatomic, assign, readonly)CGFloat left;

/*最右边x = 最左边x + width*/
@property (nonatomic, assign, readonly)CGFloat right;

/*最上边y = y*/
@property (nonatomic, assign, readonly)CGFloat top;

/*最下边y = 最上边y + height*/
@property (nonatomic, assign, readonly)CGFloat bottom;

/*获取UIView对象所在的控制器,不存在返回nil*/
@property (nonatomic, strong, readonly)UIViewController *viewController;

@end
