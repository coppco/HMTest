//
//  HJEditController.h
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJContact;
@interface HJEditController : UIViewController
@property (nonatomic, strong)HJContact  *contact;
@property (nonatomic, copy)void (^saveBlock)(HJContact *);
@end
