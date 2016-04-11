//
//  HJAddController.h
//  01-通讯录
//
//  Created by M-coppco on 16/3/23.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJAddController : UIViewController
@property (nonatomic, copy)void (^addBlock)(NSString *name, NSString *phone);
@end
