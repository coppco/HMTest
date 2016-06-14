//
//  HJEmoticon.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticon.h"

@implementation HJEmoticon
- (BOOL)isEqual:(HJEmoticon *)object {
    return self.code.length == 0 ? ([self.chs isEqualToString:object.chs]) : ([self.code isEqualToString:object.code]);
}
@end
