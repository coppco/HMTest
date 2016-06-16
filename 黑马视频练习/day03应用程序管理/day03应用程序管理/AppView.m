//
//  AppView.m
//  day03应用程序管理
//
//  Created by M-coppco on 16/1/12.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "AppView.h"
#import "Info.h"
@interface AppView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation AppView
+(AppView *)appView {
    return [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] firstObject];
}
+(AppView *)appViewWithInfo:(Info *)info {
    AppView *view = [self appView];
    view.info = info;
    return view;
}
-(void)setInfo:(Info *)info {
    _info = info;
    
    _imageV.image = info.image;
    _label.text = info.name;
}
- (IBAction)click:(UIButton *)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(appViewButtonShouldClick:)]) {
        [self.delegate appViewButtonShouldClick:self.info];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
