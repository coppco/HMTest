//
//  HJTGFooterView.m
//  02-团购
//
//  Created by M-coppco on 16/3/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJTGFooterView.h"

@interface HJTGFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *loadMore;
@property (weak, nonatomic) IBOutlet UIView *tips;

@end

@implementation HJTGFooterView
- (IBAction)click:(UIButton *)sender {
    sender.hidden = YES;
    self.tips.hidden = NO;
    
    //加载数据
    if (self.clickBlock) {
        self.clickBlock();
    }
}
- (void)endRefresh {
    //加载完成数据
    self.loadMore.hidden = NO;
    self.tips.hidden = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
