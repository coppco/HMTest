//
//  HJSearchBar.m
//  MyWeiBo
//
//  Created by M-coppco on 16/4/30.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJSearchBar.h"

@implementation HJSearchBar
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
//        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
//        leftView.size = CGSizeMake(30, 30);
//        leftView.contentMode = UIViewContentModeCenter;
//        field.leftView = leftView;
//        field.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBarWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

- (void)setLeftImage:(NSString *)leftImage {
    _leftImage = leftImage;
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftView.image = [UIImage imageNamed:_leftImage];
    
    leftView.contentMode = UIViewContentModeCenter; //
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways; //一直显示
}
- (void)setRightImage:(NSString *)rightImage {
    _rightImage = rightImage;
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    rightView.image = [UIImage imageNamed:_rightImage];
    rightView.contentMode = UIViewContentModeCenter; //
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways; //一直显示
}
@end
