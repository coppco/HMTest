//
//  ViewController.m
//  02-进度条
//
//  Created by M-coppco on 16/3/30.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet HJView *progressView;

@end

@implementation ViewController
- (IBAction)sliderChange:(UISlider *)sender {
    self.progressView.progress = sender.value;
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
