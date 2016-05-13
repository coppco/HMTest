//
//  HJCommonDefine.h
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#ifndef HJCommonDefine_h
#define HJCommonDefine_h


/*==================坐标相关==================*/
#define ViewH(view) view.frame.size.height
#define ViewW(view) view.frame.size.width
#define ViewX(view) view.frame.origin.x
#define ViewY(view) view.frame.origin.y
/*获取view的最大x*/
#define ViewMaxX(view) CGRectGetMaxX(view.frame)
/*获取view的最大y*/
#define ViewMaxY(view) CGRectGetMaxY(view.frame)

/*获取当前屏幕的bounds*/
#define KMainScreenBounds ([UIScreen mainScreen].bounds)

/*获取当前屏幕的高度*/
#define KMainScreenHeight ([UIScreen mainScreen].bounds.size.height)

/*获取当前屏幕的宽度*/
#define KMainScreenWidth  ([UIScreen mainScreen].bounds.size.width)

/*==================字符串拼接==================*/
#define STR(FORMAT, ...) [NSString stringWithFormat:FORMAT, ##__VA_ARGS__]


/*==================Property==================*/
/*通用 Property 宏定义*/
#define HJpropertyAssign(__v__)      @property (nonatomic, assign)       __v__
#define HJpropertyCopy(__v__)        @property (nonatomic, copy)         __v__
#define HJpropertyWeak(__v__)        @property (nonatomic, weak)         __v__
#define HJpropertyStrong(__v__)       @property (nonatomic, strong)       __v__

/*==================设备型号==================*/
#define ISIPHONE_3 (CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(320, 480))) && ([UIScreen mainScreen].scale == 1.0)
#define ISIPHONE_4 (CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(320, 480))) && ([UIScreen mainScreen].scale == 2.0)
#define ISIPHONE_5 CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(320, 568))
#define ISIPHONE_6 CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(375, 667))
#define ISIPHONE_6P CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(414, 736))
/*==================系统版本==================*/
#define __IOS_VERSION [[UIDevice currentDevice].systemVersion floatValue]
#define ISIOS_5_0 ([[UIDevice currentDevice].systemVersion floatValue] >= 5.0)
#define ISIOS_6_0 ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
#define ISIOS_7_0 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define ISIOS_8_0 ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define ISIOS_9_0 ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)

/*==================UIColor==================*/
/*随机*/
#define ColorRandom ColorFromRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
/*字符串转color*/
#define ColorFromString(x) [HJTool colorFromHexCode:x]
/*清除背景色*/
#define ColorClear [UIColor clearColor]
/*带有RGBA的颜色设置*/
#define ColorFromRGBA(R, G, B, A) ([UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)])
#define ColorFromRGB(R, G, B) ColorFromRGBA(R,G,B,1.0f)
/* rgb颜色转换（16进制->10进制）*/
#define ColorFromRGBValue(rgbValue) \
[HJTool colorFromRGBValue:(rgbValue)] \

/*=============UIFont对象===========*/
#define font(x) [UIFont systemFontOfSize:x]
#define fontWeight(x,y) [UIFont systemFontOfSize:x weight:y]

/*=============UIImage对象============*/
//性能高于后者, 需要图片没有放在Assets中
#define IMAGEFILE(A) \
[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]] \

//
#define IMAGE(A) [UIImage imageNamed:A]

/*=============PATH===========*/
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT \
[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] \
/*==============WEAK,定义weakSelf============*/
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self

/*===================NSLog=================*/
#ifdef DEBUG
#define XHJLog(FORMAT, ...) NSLog(@"%@:%d行   \n%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
#else
#define XHJLog(FORMAT, ...) nil
#endif

//#ifdef DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d　\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif
/*================单例的宏定义=================*/
/**
 *  使用方法
 *
 *  1，在.h里调用 singleton_for_header(类名)
 *  2，在.m里调用 singleton_for_class(类名)
 */
// .h 调用
#define singleton_for_header(className) \
\
+ (className *)shared##className;


// .m 调用
#define singleton_for_class(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/*================提醒=================*/
#define alert(msg) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil]; [alert show];}


#endif /* HJCommonDefine_h */
