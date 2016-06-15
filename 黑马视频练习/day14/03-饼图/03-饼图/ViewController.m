//
//  ViewController.m
//  03-饼图
//
//  Created by M-coppco on 16/3/30.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJPieView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet HJPieView *pieView;

@end

@implementation ViewController
- (IBAction)change:(id)sender {
    NSMutableArray *array = [NSMutableArray array];
    NSInteger i = arc4random() % 6 + 4;
    for (NSInteger j = 0; j < i; j++) {
        NSInteger y = arc4random() % 100 + 10;
        NSNumber *num = [NSNumber numberWithInteger:y];
        [array addObject:num];
    }
    self.pieView.numbers = array;
    NSLog(@"%@", self.pieView.numbers);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self change:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
