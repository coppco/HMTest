//
//  HJSinaStatus.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/18.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJSinaStatus.h"
#import "RegexKitLite.h"
#import "HJSinaUser.h"
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

- (void)setText:(NSString *)text {
    _text = text;
    
    self.attributedText = [self textToAttributedString:text];
}
- (void)setRetweeted_status:(HJSinaStatus<Optional> *)retweeted_status {
    _retweeted_status = retweeted_status;
    NSString *string = [NSString stringWithFormat:@"@%@:%@", retweeted_status.user.name, retweeted_status.text];
    XHJLog(@"%@", retweeted_status.user.name);
    self.retweeted_attributedText = [self textToAttributedString:string];
}
- (NSMutableAttributedString *)textToAttributedString:(NSString *)text {
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSString *emojiPattern = @"\\[.+\\]";
    NSString *atPattern = @"@[a-zA-Z\\u4e00-\\u9fa5_0-9-]+";
    NSString *topicPattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";
    NSString *urlPattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    NSString *pattern = [NSString stringWithFormat:@"%@|%@|%@|%@", emojiPattern, atPattern, topicPattern, urlPattern];
    [text enumerateStringsMatchedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:*capturedRanges];
    }];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, string.length)];
    return string;
}
@end
