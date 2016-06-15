//
//  HJHelpViewController.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/19.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJHelpViewController.h"
#import "HJSettingItem.h"
#import "HJHelpModel.h"
#include "HJHTMLViewController.h"
#import "HJNavigationController.h"
@interface HJHelpViewController ()
@property (nonatomic, strong)NSArray  *htmlData;
@end

@implementation HJHelpViewController
- (NSArray *)htmlData {
    if (_htmlData == nil) {
        _htmlData = [HJHelpModel help];
    }
    return _htmlData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstSection];
}
- (void) addFirstSection {
    NSMutableArray *array = [NSMutableArray array];
    for (HJHelpModel *model in self.htmlData) {
        HJSettingItem *item = [HJSettingItem settingItemWithTitle:model.title image:nil type:(HJSettingItemTypeArrow)  labelText:nil selected:^{
            HJHTMLViewController *html = [[HJHTMLViewController alloc] init];
            html.model = model;
            HJNavigationController *nav = [[HJNavigationController alloc] initWithRootViewController:html];
            [self presentViewController:nav animated:YES completion:^{
                
            }];
        }];
        [array addObject:item];
    }

    HJSettingGroup *group = [HJSettingGroup settingGroupWithHeaderTitle:nil items:array footerTitle:nil];
    [self.dataList addObject:group];
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
