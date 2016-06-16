//
//  HJEmoticonTool.m
//  MyWeiBo
//
//  Created by M-coppco on 16/6/1.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticonTool.h"
#import "HJEmoticon.h"
static NSMutableArray *_emoticons;
@implementation HJEmoticonTool

+ (void)initialize {
    _emoticons = [NSMutableArray arrayWithContentsOfFile:[self path]];
    if (_emoticons == nil) {
        _emoticons = [NSMutableArray array];
    }
}

+ (void)addEmoticon:(HJEmoticon *)emoticon {
    [_emoticons addObject:[emoticon toDictionary]];
    [_emoticons writeToFile:[self path] atomically:YES];
}
+ (NSArray *)recentEmoticons {
    return _emoticons;
}
+ (NSString *)path {
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [document stringByAppendingPathComponent:@"emoticons.plist"];
}
@end
