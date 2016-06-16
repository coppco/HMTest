//
//  Person.h
//  5-02___iOS新特性之泛型
//
//  Created by M-coppco on 16/6/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  @author M-coppco, 16-06-16 06:06:58
 *
 *  定义类的时候定义了一个泛型Type
 */
@interface Person<Type> : NSObject

/**有一个语言属性,可能iOS, Java等, 使用泛型Type来定义*/
@property (nonatomic, strong)Type language;

@end
