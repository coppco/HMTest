//
//  HJDrawView.h
//  05-画板
//
//  Created by M-coppco on 16/4/6.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJDrawView : UIView
@property (nonatomic, assign)CGFloat lineWidth;//线宽
@property (nonatomic, strong)UIColor *color;//颜色
@property (nonatomic, strong)UIImage *drawImage;  //图像
//清屏
- (void)cleanScreen;
//撤销
- (void)undo;
//截屏
- (UIImage *)quickImage;
@end
