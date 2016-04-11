//
//  ViewController.m
//  01-点菜系统
//
//  Created by M-coppco on 16/3/18.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong)NSArray  *foodsData;
@property (weak, nonatomic) IBOutlet UILabel *shuiguo;
@property (weak, nonatomic) IBOutlet UILabel *zhushi;
@property (weak, nonatomic) IBOutlet UILabel *yinliao;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController
- (NSArray *)foodsData {
    if (_foodsData == nil) {
        _foodsData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
    }
    return _foodsData
    ;
}
- (IBAction)suiji:(UIBarButtonItem *)sender {
    int randd = arc4random_uniform(12);//0---11
    /* 方法1
    NSInteger suiji0 = arc4random() % ([self.foodsData[0] count]);
    NSInteger suiji1 = arc4random() % ([self.foodsData[1] count]);
    NSInteger suiji2 = arc4random() % ([self.foodsData[2] count]);
    
    //更新
    [self.picker selectRow:suiji0 inComponent:0 animated:YES];
    [self.picker selectRow:suiji1 inComponent:1 animated:YES];
    [self.picker selectRow:suiji2 inComponent:2 animated:YES];
    
    //文字
    self.shuiguo.text = self.foodsData[0][suiji0];
    self.zhushi.text = self.foodsData[1][suiji1];
    self.yinliao.text = self.foodsData[2][suiji2];
     */
    for (int i = 0; i < self.foodsData.count; i++) {
        NSArray *items = self.foodsData[i];
        
        NSInteger rowCount1 = items.count;
        int randomRow = arc4random() % rowCount1;
        
        [self pickerView:nil didSelectRow:randomRow inComponent:i];
        [self.picker selectRow:randomRow inComponent:i animated:YES];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - UIPickerViewDataSource 和 UIPickerViewDelegate
/**
 *  pickerView的组数
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.foodsData.count;
}
/**
 *  每一组的行数
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.foodsData[component] count];
}
/**
 *  每一行的名称
 */
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.foodsData[component][row];
}
/**
 *  选中item
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (0 == component) {
        self.shuiguo.text = self.foodsData[component][row];
    }
    if (1 == component) {
        self.zhushi.text = self.foodsData[component][row];
    }
    if (2 == component) {
        self.yinliao.text = self.foodsData[component][row];
    }
}
@end
