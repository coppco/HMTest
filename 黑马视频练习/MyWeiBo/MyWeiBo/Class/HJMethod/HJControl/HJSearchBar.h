//
//  HJSearchBar.h
//  MyWeiBo
//
//  Created by M-coppco on 16/4/30.
//  Copyright © 2016年 XHJ. All rights reserved.
//   自定义搜索框

#import <UIKit/UIKit.h>

@interface HJSearchBar : UITextField
/*左边图片*/
@property (nonatomic, copy)NSString *leftImage;
/*右边图片*/
@property (nonatomic, copy)NSString *rightImage;

+ (instancetype)searchBarWithFrame:(CGRect)frame;
@end
