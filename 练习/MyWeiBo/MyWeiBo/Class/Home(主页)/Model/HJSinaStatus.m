//
//  HJSinaStatus.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJSinaStatus.h"

@implementation HJSinaStatus
//重写getter方法  获取时间的时候转换
- (NSString *)created_at {
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss ZZZZ yyyy";
    //如果设置locale, 不是本时区需要设置
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]; //设置那个时区
    NSDate *date = [formatter dateFromString:_created_at];
    
//    NSString *string = STR(@"%.0f", [date timeIntervalSince1970]);
    return timeAgoFromDate(date);  //
//    return timeAgoFromTimeString([formatter stringFromDate:date]);
//    return timeAgoFromTimestamp(string); //
}
- (void)setSource:(NSString *)source {
    NSRange rangeFollow = [source rangeOfString:@"rel=\"nofollow\">"];
    NSRange rangeA = [source rangeOfString:@"</a>"];
    _source = [NSString stringWithFormat:@"来自:%@",[source substringWithRange:NSMakeRange(rangeFollow.location + rangeFollow.length, rangeA.location - rangeFollow.location - rangeFollow.length)]];
}
@end
