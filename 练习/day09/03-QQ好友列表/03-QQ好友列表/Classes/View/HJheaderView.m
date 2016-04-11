//
//  HJheaderView.m
//  03-QQ好友列表
//
//  Created by M-coppco on 16/3/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJheaderView.h"
#import "FriendGroupModel.h"
@interface HJheaderView ()
@property (nonatomic, strong)UIButton  *buttonB;
@property (nonatomic, strong)UILabel  *countL;
@end

@implementation HJheaderView
+ (instancetype)headerViewWith:(UITableView *)tableView {
    HJheaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:@"header"];
    }
    return headerView;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.buttonB = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.buttonB addTarget:self action:@selector(buttonClick) forControlEvents:(UIControlEventTouchUpInside)];
        //图片
        [self.buttonB setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:(UIControlStateNormal)];
        self.buttonB.imageView.contentMode = UIViewContentModeCenter;  //图片居中显示
        self.buttonB.imageView.clipsToBounds = NO;
        
        //标题颜色
        [self.buttonB setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        //水平对齐方式
        self.buttonB.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //按钮的内边距
        self.buttonB.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //文字的内边距
        self.buttonB.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //图片的内边距
//        self.buttonB.imageEdgeInsets
        
        [self.contentView addSubview:self.buttonB];
        
        self.countL  = [[UILabel alloc] init];
        self.countL.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.countL];
    }
    return self;
}
//在自身的frame改变的时候重新布局
- (void)layoutSubviews {
    self.buttonB.frame = self.bounds;
    
    self.countL.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150 - 10, 0, 150, self.bounds.size.height);
    
    CGFloat angle = self.model.open ? M_PI_2 : 0;
    self.buttonB.imageView.transform = CGAffineTransformMakeRotation(angle);
    
    [super layoutSubviews];
}
/**
 *  当 当前的view加载到父控件的时候调用
 */
- (void)didMoveToSuperview {

//    CGFloat angle = self.model.open ? M_PI_2 : 0;
//    self.buttonB.imageView.transform = CGAffineTransformMakeRotation(angle);
}
- (void)buttonClick {
    self.model.open = !self.model.open;

    if (self.headerBlock) {
        self.headerBlock(self);
    }
}
- (void)setModel:(FriendGroupModel *)model {
    _model = model;
    
    [self.buttonB setTitle:model.name forState:(UIControlStateNormal)];
    self.countL.text = [NSString stringWithFormat:@"%ld/%lu", (long)model.online, (unsigned long)model.friends.count];
}
@end
