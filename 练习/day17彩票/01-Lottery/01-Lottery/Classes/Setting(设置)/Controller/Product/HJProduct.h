//
//  HJProduct.h
//  01-Lottery
//
//  Created by M-coppco on 16/4/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJProduct : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *customUrl;

+ (NSArray *)products;
@end
