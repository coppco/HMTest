//
//  ViewController.m
//  5-01___iOS9新特性之关键字
//
//  Created by M-coppco on 16/6/15.
//  Copyright © 2016年 M-coppco. All rights reserved.
//    关键字nonnull, nullable

#import "ViewController.h"

@interface ViewController ()
/**
 关键字nonnull, nullable修饰对象.nullable表示可空  nonnull非空
     宏NS_ASSUME_NONNULL_BEGIN和NS_ASSUME_NONNULL_END之间定义的属性都是非空,除了使用null_resettable修饰的
 
 */
@property (nonatomic, strong, nullable)NSString  *name;
@property (nonatomic, strong)NSString  * _Nonnull name1;
@property (nonatomic, strong)NSString  * __nonnull name2;
@end

@implementation ViewController

/**
 *  @author M-coppco, 16-06-16 06:06:16
 *
 *  修饰方法里面的返回值和参数
 */

- (nonnull NSString *)abcdWith:(nonnull NSString *)str {
    return @"haha";
}
- (nonnull NSString *)abcd1With:(NSString * __nonnull)str {
    return @"haha";
}
- (nonnull NSString *)abcd2With:(NSString * _Nonnull)str {
    return @"haha";
}
- (nonnull NSString *)abcd {
    return @"haha";
}

- (NSString * __nonnull)qwe {
    return @"haha";
}
- (NSString * _Nonnull)asd {
    return @"haha";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
