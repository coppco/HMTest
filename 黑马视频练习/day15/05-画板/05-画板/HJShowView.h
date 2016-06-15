//
//  HJShowView.h
//  05-画板
//
//  Created by M-coppco on 16/4/7.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJShowView : UIView
@property (nonatomic, strong)UIImage  *image;
@property (nonatomic, strong)void (^imageBlock)(UIImage *);
@end
