//
//  ViewController.m
//  5-02___iOS新特性之泛型
//
//  Created by M-coppco on 16/6/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "iOS.h"
#import "Java.h"

#import "Student.h"
@interface ViewController ()

/**使用泛型修饰的数组, 数组里面只能存放UIView*/
@property (nonatomic, strong)NSMutableArray<UIView *>  *views;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义泛型实例:
    //指定泛型是iOS *, 后面属性赋值@"".有警告
    //__covariant
    Person<iOS *> *person = [[Person alloc] init];
    person.language = @"";
    person.language = [[iOS alloc] init];
    
    
//    __kindof  表示当前类或者它的子类
    iOS *ios = [iOS language];
    Language *language = [Language language];
    Java *java = [Java language];
}
/**
 *  泛型只能修饰方法的调用,属性的设置
   使用泛型修饰的属性数组, 数组里面只能存放UIView
@property (nonatomic, strong)NSMutableArray<UIView *>  *views;//属性
 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  //方法
*/

/**
 *  @author M-coppco, 16-06-16 06:06:31
 *
 *  这里面(NSSet<UITouch *> *)就是泛型
     1⃣️:通常用在集合(数组,字典,NSSet中)
     2⃣️:在声明一个类的时候,类里面的有些属性不确定,才使用泛型
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
@end
