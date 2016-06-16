//
//  HJTGFooterView.h
//  02-团购
//
//  Created by M-coppco on 16/3/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJTGFooterView : UIView
//block
@property (nonatomic, copy)void (^clickBlock)();
/**
 *  刷新数据完成后操作
 */
- (void)endRefresh;
@end
