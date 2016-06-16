//
//  HJSinaUser.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJSinaUser.h"

@implementation HJSinaUser

- (void)setMbrank:(int)mbrank {
    _mbrank = mbrank;
    
    if (mbrank > 2) {
        self.isVip = @YES;
    } else {
        self.isVip = @NO;
    }
}
@end
