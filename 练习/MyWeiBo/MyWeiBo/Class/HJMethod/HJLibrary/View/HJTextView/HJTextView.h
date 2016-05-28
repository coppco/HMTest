//
//  HJTextView.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/23.
//  Copyright © 2016年 XHJ. All rights reserved.
//  添加placeholder(占位符)的textView

#import <UIKit/UIKit.h>

@interface HJTextView : UITextView
/**占位符*/
@property (nonatomic, copy)NSString *placeholder;
/**占位符颜色,默认grayColor*/
@property (nonatomic, strong)UIColor *placeholderColor;

@property (nonatomic, strong)UIImage  *image;
@end
