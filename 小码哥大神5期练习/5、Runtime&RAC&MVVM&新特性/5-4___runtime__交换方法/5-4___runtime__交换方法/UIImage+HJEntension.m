//
//  UIImage+HJEntension.m
//  5-4___runtime__交换方法
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "UIImage+HJEntension.h"
#import <objc/runtime.h>

//class_getClassMethod  获取类方法
//class_getInstanceMethod 获取实例方法
//class_getMethodImplementation  方法的实现
@implementation UIImage (HJEntension)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //交换方法, 那么每次调用imageNamed,都会替换成hj_imageNamed方法
        Method imageNamed = class_getClassMethod([UIImage class], @selector(imageNamed:));
        Method new = class_getClassMethod([UIImage class], @selector(hj_imageNamed:));
        method_exchangeImplementations(imageNamed, new);
    });
}
+ (UIImage *)hj_imageNamed:(NSString *)name {
    UIImage *image = [UIImage hj_imageNamed:name];
    if (!image) {
        NSLog(@"图片为空:图片名称:%@", name);
    }
    return image;
}

NSDictionary *GetPropertyListOfObject(NSObject *object){
    return GetPropertyListOfClass([object class]);
}

NSDictionary *GetPropertyListOfClass(Class cls){
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        const char *propType = property_getAttributes(property);
        if(propType&&propName) {
            NSArray *anAttribute = [[NSString stringWithUTF8String:propType]componentsSeparatedByString:@","];
            NSString *aType = anAttribute[0];
            //暂时不能去掉前缀T@\"和后缀"，需要用以区分标量与否
            //            if ([aType hasPrefix:@"T@\""]) {
            //                aType = [aType substringWithRange:NSMakeRange(3, [aType length]-4)];
            //            }else{
            //                aType = [aType substringFromIndex:1];
            //            }
            [dict setObject:aType forKey:[NSString stringWithUTF8String:propName]];
        }
    }
    free(properties);
    
    return dict;
}

//静态就交换静态，实例方法就交换实例方法
void Swizzle(Class c, SEL origSEL, SEL newSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method newMethod = nil;
    if (!origMethod) {
        origMethod = class_getClassMethod(c, origSEL);
        if (!origMethod) {
            return;
        }
        newMethod = class_getClassMethod(c, newSEL);
        if (!newMethod) {
            return;
        }
    }else{
        newMethod = class_getInstanceMethod(c, newSEL);
        if (!newMethod) {
            return;
        }
    }
    
    //自身已经有了就添加不成功，直接交换即可
    if(class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else{
        method_exchangeImplementations(origMethod, newMethod);
    }
}
@end
