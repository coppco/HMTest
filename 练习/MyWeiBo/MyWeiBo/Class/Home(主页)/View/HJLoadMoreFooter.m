//
//  HJLoadMoreFooter.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJLoadMoreFooter.h"

@implementation HJLoadMoreFooter

+ (instancetype)footer {
    return [[[NSBundle mainBundle] loadNibNamed:@"HJLoadMoreFooter" owner:nil options:nil] firstObject];
}

@end
