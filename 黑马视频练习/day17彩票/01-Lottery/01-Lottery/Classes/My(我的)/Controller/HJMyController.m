//
//  HJMyController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/15.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJMyController.h"
#import "HJSettingTableViewController.h"

@interface HJMyController ()
@property (weak, nonatomic) IBOutlet UIButton *loginB;

@end

@implementation HJMyController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (IBAction)toSetting:(UIBarButtonItem *)sender {
    HJSettingTableViewController *setting = [[HJSettingTableViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    [self.loginB setBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:(UIControlStateNormal)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
