//
//  HJHelpModel.h
//  01-Lottery
//
//  Created by M-coppco on 16/4/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJHelpModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *html;
@property (nonatomic, copy)NSString *ID;

+ (NSArray *)help;
@end
