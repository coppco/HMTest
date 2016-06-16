//
//  HJEmoticonKeyboard.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/28.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticonKeyboard.h"
#import "HJEmoticonBottom.h"
#import "HJEmoticonListView.h"
#import "HJEmoticon.h"
#import "HJEmoticonTool.h"

@interface HJEmoticonKeyboard ()<iCarouselDataSource, iCarouselDelegate>
/**下方工具条*/
@property (nonatomic, strong)HJEmoticonBottom  *bottomView;

/**iCarousel内容*/
@property (nonatomic, strong)iCarousel  *listView;

/**最近表情数组*/
@property (nonatomic, strong)NSMutableArray  *recentArray;
/**默认表情数组*/
@property (nonatomic, strong)NSArray  *defaultArray;
/**Emoji表情数组*/
@property (nonatomic, strong)NSArray  *emojiArray;
/**浪小花表情数组*/
@property (nonatomic, strong)NSArray  *lxhArray;

@end

@implementation HJEmoticonKeyboard
- (iCarousel *)listView {
    if (_listView == nil) {
        _listView = [[iCarousel alloc] init];
        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.pagingEnabled = YES;
        _listView.bounces = NO;
        _listView.scrollSpeed = 0.6;
        
    }
    return _listView;
}
- (HJEmoticonBottom *)bottomView {
    if (!_bottomView) {
        WeakSelf(weak);
        _bottomView = [[HJEmoticonBottom alloc] init];
        [_bottomView setButtonClick:^(HJEmoticonBottomType type) {
            [weak didSelectButtonWithType:type];
        }];
    }
    return _bottomView;
}
//切换键盘内容
- (void)didSelectButtonWithType:(HJEmoticonBottomType)type {
    [self.listView scrollToItemAtIndex:type animated:NO];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.listView];
        [self addSubview:self.bottomView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.bottomView.frame = CGRectMake(0, self.height - 37, self.width, 37);
    
    self.listView.frame = CGRectMake(0, 0, self.width, self.height - self.bottomView.height);
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return 4;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    HJEmoticonListView *listView = (HJEmoticonListView *)view;
    if (!listView) {
        listView = [[HJEmoticonListView alloc] initWithFrame:carousel.bounds];
        [listView setEmoticonHasClick:^(HJEmoticon *emoticon) {
            if (![self.recentArray containsObject:emoticon]) {
                [self.recentArray insertObject:emoticon atIndex:0];
                [HJEmoticonTool addEmoticon:emoticon];
                [self.listView reloadItemAtIndex:0 animated:NO];
            } 
            //往textView添加文本的block
            if (self.buttonClick) {
                self.buttonClick(emoticon);
            }
        }];
    }
    if (0 == index) {
        listView.emoticons = self.recentArray;
    }else if (index == 1) {
        listView.emoticons = self.defaultArray;
    } else if (2 == index) {
        listView.emoticons = self.emojiArray;
    } else {
        listView.emoticons = self.lxhArray;
    }
    return listView;
}
#pragma - mark 懒加载
- (NSArray *)defaultArray {
    if (!_defaultArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        _defaultArray = [HJEmoticon arrayOfModelsFromDictionaries:[NSArray arrayWithContentsOfFile:path]];
    }
    return _defaultArray;
}
- (NSArray *)emojiArray {
    if (!_emojiArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        _emojiArray = [HJEmoticon arrayOfModelsFromDictionaries:[NSArray arrayWithContentsOfFile:path]];
    }
    return _emojiArray;
}
- (NSArray *)lxhArray {
    if (!_lxhArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
        _lxhArray = [HJEmoticon arrayOfModelsFromDictionaries:[NSArray arrayWithContentsOfFile:path]];
    }
    return _lxhArray;
}
- (NSMutableArray *)recentArray {
    if (!_recentArray) {
        NSArray *array = [HJEmoticonTool recentEmoticons];
        if (array.count != 0) {
            _recentArray = [HJEmoticon arrayOfModelsFromDictionaries:array];
        } else {
            _recentArray = [NSMutableArray array];
        }
    }
    return _recentArray;
}
@end
