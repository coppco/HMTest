//
//  Person.m
//  5-05___runtime_动态添加方法
//
//  Created by M-coppco on 16/6/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

/**
 *  @author M-coppco, 16-06-18 07:06:40
 *
 *  默认一个方法都有两个参数:  self 和 _cmd ,  隐式参数
 */

void aaaa (id self, SEL _cmd) {
    NSLog(@"吃");
}
void abc (id self, SEL _cmd, id chi) {
    NSLog(@"%@", chi);
}
@implementation Person
//类方法
+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(eat)) {
        /*
         * cls  哪个类添加方法
            SEL   添加的方法编号
            IMP  方法的实现
            types   方法参数类型
         */
        class_addMethod([self class], sel, (IMP)aaaa, "v@:");
        return YES;

    }
    return [super resolveClassMethod:sel];
}

//实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(eat)) {
        /*
         * cls  哪个类添加方法
         SEL   添加的方法编号
         IMP  方法的实现
         types   方法参数类型
    class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
         */
        class_addMethod([self class], sel, (IMP)aaaa, "v@:");
        return YES;
    } else if (sel == @selector(eat:)) {
        class_addMethod([self class], sel, (IMP)abc, "v@:@");
        //v:  void  返回值,  @ id  : SEL
        return YES;
    }
    NSLog(@"%@", NSStringFromSelector(sel));
    return [super resolveInstanceMethod:sel];
}
@end
