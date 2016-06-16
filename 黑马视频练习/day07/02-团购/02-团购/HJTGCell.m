//
//  HJTGCell.m
//  02-团购
//
//  Created by M-coppco on 16/3/9.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "HJTGCell.h"
#import "HJTG.h"
@interface HJTGCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *countL;

@end

@implementation HJTGCell
/**
 *  使用纯代码创建单元格的时候使用,使用xib不会走
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
/**
 *  使用xib创建代码的时候会走
 */
- (void)awakeFromNib {
    // Initialization code
}
/**
 *  cell 被选中或者取消选中的时候会走
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.contentView.backgroundColor = [UIColor redColor];
    } else {
        self.contentView.backgroundColor = [UIColor greenColor];
    }
    // Configure the view for the selected state
}
- (void)setModel:(HJTG *)model {
    _model = model;
    //赋值
    self.imageV.image = [UIImage imageNamed:model.icon];
    self.titleL.text = model.title;
    self.priceL.text = [NSString stringWithFormat:@"¥:%@", model.price];
    self.countL.text = [NSString stringWithFormat:@"已有%@人购买", model.buyCount];
}
@end
