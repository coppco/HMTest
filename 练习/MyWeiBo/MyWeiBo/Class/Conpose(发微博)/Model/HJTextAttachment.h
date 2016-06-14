//
//  HJTextAttachment.h
//  MyWeiBo
//
//  Created by M-coppco on 16/6/1.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJEmoticon;
@interface HJTextAttachment : NSTextAttachment
/**emoticon*/
@property (nonatomic, strong)HJEmoticon  *emoticon;
@end
