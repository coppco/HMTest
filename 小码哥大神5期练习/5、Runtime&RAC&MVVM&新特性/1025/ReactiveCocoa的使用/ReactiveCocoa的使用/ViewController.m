//
//  ViewController.m
//  ReactiveCocoa的使用
//
//  Created by M-coppco on 16/7/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import <NSObject+RACKVOWrapper.h>
@interface ViewController ()
/**订阅者*/
@property (nonatomic, strong)id<RACSubscriber> subscriber;

/**<#描述#>*/
@property (nonatomic, strong)RACReplaySubject *repaly;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self UseSignal];
//    [self useSubject];
//    [self useReplaySubject];

    [self moreAPI];
}

- (void)UseSignal {
    //1⃣️创建信号(冷信号)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        _subscriber = subscriber;
        //作用:发送数据
        //调用:当信号被订阅的时候
        
        //3⃣️发送数据
        [subscriber sendNext:@"RACSignal"];
    
        return [RACDisposable disposableWithBlock:^{
            //只要信号取消了订阅才会执行block
            NSLog(@"信号取消订阅了");
        }];
    }];
    
    //2⃣️订阅信号---->变为热信号
   RACDisposable *disposable = [signal subscribeNext:^(id x) {
        //作用:接收到数据
        //调用:当接收到数据的时候
        NSLog(@"%@", x);
    }];
    
//    取消订阅
//    [disposable dispose];
    
}


- (void)useSubject {
    //一、创建信号
    RACSubject *subject = [RACSubject subject];

    //二、订阅信号,可以订阅多次
    [subject subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    [subject subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    //三、发送数据
    [subject sendNext:@"RACSubject"];
    
}

- (void)useReplaySubject {
     //一、创建信号
    RACReplaySubject *replay = [RACReplaySubject subject];
    self.repaly = replay;
    //二、订阅信号
    [replay subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    //三、发送数据
    [replay sendNext:@"RACReplaySubject"];
    
    //再次发送数据,订阅信号
    [replay sendNext:@"RACReplaySubject-------"];
    [replay subscribeNext:^(id x) {
        NSLog(@"==%@", x);
    }];
}

- (void)moreAPI {
    RACSignal *sellSignal =  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //网络请求
        [subscriber sendNext:@"获取动求购信息"];
        return  nil;
    }];
    
    RACSignal *buySignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //网络请求
        [subscriber sendNext:@"获取动求购信息"];
        return  nil;
    }];
    
    //数组用来存放 信号
    //当数组中的所有信号都发送数据的时候,才会执行selector
    //该方法的参数个数必须和数组中信号个数一致
    [self rac_liftSelector:@selector(updateUIWithSellData: buyData:) withSignals:sellSignal, buySignal, nil];
}
- (void)updateUIWithSellData:(NSString *)sell buyData:(NSString *)buy {
    NSLog(@"%@====%@", sell, buy);
}

- (void)RACTuple {
    RACTuple *tuple = [RACTuple tupleWithObjects:@"1", @"2", @"3", nil];
    NSString *str = tuple[0];
    //用来解析RACTuple类型
    RACTupleUnpack(NSString *key, NSString *value) = tuple;
    
}

- (void)RACSequence {
    //数组
    NSArray *arr = @[@"1",@"2", @"3", @"4"];
    //RAC集合
    RACSequence *sequence = arr.rac_sequence;
    //把集合转成信号
    RACSignal *signal = sequence.signal;
    //订阅集合信号,内部会自动遍历所有的元素发出去
    [signal subscribeNext:^(id x) {
        NSLog(@"%@", x); //打印1,2,3,4
    }];
    
    //连起来写
    [@[@"1", @"3"].rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@", x);//打印1,3
    }];
}

- (void)kvo {
    [self rac_observeKeyPath:@"frame" options:(NSKeyValueObservingOptionNew) observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        //code
    }];
    
    [[self rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id x) {
        //code
    }];
}

- (void)event {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [[button rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        //code
    }];
}

- (void)notification {
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        //code
    }];
}

- (void)textfield {
    UITextField *textfield = [UITextField new];
    [textfield.rac_textSignal subscribeNext:^(id x) {
        //code
    }];
}

@end
