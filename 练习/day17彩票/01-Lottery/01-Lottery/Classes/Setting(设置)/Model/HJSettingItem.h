//
//  HJSettingItem.h
//  01-Lottery
//
//  Created by M-coppco on 16/4/15.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 每一行的信息
 */
typedef enum : NSUInteger {
    HJSettingItemTypeSwitch,  //switch开关
    HJSettingItemTypeArrow,  //箭头
} HJSettingItemType;

@interface HJSettingItem : NSObject
@property (nonatomic, copy)NSString *title;//标题
@property (nonatomic, copy)NSString *image; //图片
@property (nonatomic, assign)HJSettingItemType type;  //右侧的类型
@property (nonatomic, copy)void (^selected)();  //功能
/**
 *  初始化方法
 *
 *  @param title  标题
 *  @param image  图片名字
 *  @param type   箭头类型
 *  @param selected 选择的block
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title image:(NSString *)image type:(HJSettingItemType)type selected:(void (^)())selected;
+ (instancetype)settingItemWithTitle:(NSString *)title image:(NSString *)image type:(HJSettingItemType)type selected:(void (^)())selected;
@end

/**
 *  每一个分区信息
 */
@interface HJSettingGroup : NSObject
@property (nonatomic, copy)NSString *headerTitle;//分区头标题
@property (nonatomic, strong)NSMutableArray  <HJSettingItem *>*items; //分区里面的内容
@property (nonatomic, copy)NSString *footerTitle;//分区尾标题
- (instancetype)initWithHeaderTitle:(NSString *)headerTitle items:(NSMutableArray *)items footerTitle:(NSString *)footerTitle;
+ (instancetype)settingGroupWithHeaderTitle:(NSString *)headerTitle items:(NSMutableArray *)items footerTitle:(NSString *)footerTitle;
@end
