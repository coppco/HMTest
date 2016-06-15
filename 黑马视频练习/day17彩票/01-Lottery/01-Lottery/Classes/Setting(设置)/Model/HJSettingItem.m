//
//  HJSettingItem.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/15.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJSettingItem.h"

@implementation HJSettingItem
- (instancetype)initWithTitle:(NSString *)title image:(NSString *)image type:(HJSettingItemType)type labelText:(NSString *)labelText selected:(void (^)())selected; {
    self = [super init];
    if (self) {
        _type = type;
        self.title = title;
        self.image = image;
        self.labelText = labelText;
        _selected = selected;
    }
    return self;
}
+ (instancetype)settingItemWithTitle:(NSString *)title image:(NSString *)image type:(HJSettingItemType)type labelText:(NSString *)labelText selected:(void (^)())selected; {
    return [[self alloc] initWithTitle:title image:image type:type labelText:labelText selected:selected];
}
@end

@implementation HJSettingGroup
- (instancetype)initWithHeaderTitle:(NSString *)headerTitle items:(NSMutableArray *)items footerTitle:(NSString *)footerTitle {
    self = [super init];
    if (self) {
        self.headerTitle = headerTitle;
        self.footerTitle = footerTitle;
        self.items = items;
    }
    return self;
}
+ (instancetype)settingGroupWithHeaderTitle:(NSString *)headerTitle items:(NSMutableArray *)items footerTitle:(NSString *)footerTitle {
    return [[self alloc] initWithHeaderTitle:headerTitle items:items footerTitle:footerTitle];
}
@end
