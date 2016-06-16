//
//  HJMessageFrameModel.h
//  08-QQ界面
//
//  Created by M-coppco on 16/3/14.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HJMessageModel;
@interface HJMessageFrameModel : NSObject
@property (nonatomic, assign, readonly)CGRect timeF;
@property (nonatomic, assign, readonly)CGRect textF;
@property (nonatomic, assign, readonly)CGRect iconF;
@property (nonatomic, assign, readonly)CGFloat cellH;
@property (nonatomic, strong)HJMessageModel *message;
@end
