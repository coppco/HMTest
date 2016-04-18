//
//  HJCollectionViewCell.m
//  01-Lottery
//
//  Created by M-coppco on 16/4/17.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJCollectionViewCell.h"
#import "HJProduct.h"
@interface HJCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation HJCollectionViewCell

- (void)awakeFromNib {
    self.imageV.layer.cornerRadius = 5;
    self.imageV.clipsToBounds = YES;
}
- (void)setProduct:(HJProduct *)product {
    _product = product;
    self.imageV.image = [UIImage imageNamed:[[product.icon componentsSeparatedByString:@"@"] firstObject]];
    self.title.text = product.title;
    self.title.adjustsFontSizeToFitWidth = YES;
}
@end
