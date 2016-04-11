//
//  ViewController.m
//  02-datePicker和键盘的处理
//
//  Created by M-coppco on 16/3/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *birthday;
@property (nonatomic, strong)UIDatePicker  *datePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datePicker = [[UIDatePicker alloc] init];
    //设置本地化为祖国
    _datePicker.locale =  [NSLocale localeWithLocaleIdentifier:@"zh"];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    self.birthday.inputView = _datePicker;
    //设置inputAccessoryView  可以在键盘添加自定义view
    //inputAccessoryView
    UIToolbar *tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    tool.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *up = [[UIBarButtonItem alloc] initWithTitle:@"上一个" style:(UIBarButtonItemStylePlain) target:self action:@selector(done)];
    UIBarButtonItem *down = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:(UIBarButtonItemStylePlain) target:self action:@selector(done)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(done)];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:(UIBarButtonItemStylePlain) target:self action:@selector(done)];
    tool.items = @[up, down, space, done];
    self.birthday.inputAccessoryView = tool;
}
- (void)done {
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *string = [formatter stringFromDate:date];
    self.birthday.text = string;
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
