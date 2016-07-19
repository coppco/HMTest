//
//  ViewController.m
//  ReactiveCocoa的使用
//
//  Created by M-coppco on 16/7/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UseSignal];
}

- (void)UseSignal {
    //1⃣️创建信号(冷信号)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //作用:发送数据   调用:当信号被订阅的时候
        
        //3⃣️发送数据
        [subscriber sendNext:@"124"];
        return nil;
    }];
    
    //2⃣️订阅信号---->变为热信号
    [signal subscribeNext:^(id x) {
        //作用:接收到数据    调用:当接收到数据的时候
        NSLog(@"%@", x);
    }];
    
    
}

@end
