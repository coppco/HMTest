//
//  HJStatusPhotoView.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/21.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJStatusPhotoView.h"
#import "HJPhoto.h"
#define kCellReuseIndentify @"HJStatusPhotoView"
@interface HJStatusPhotoView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView  *collectionView;

@property (nonatomic, strong)UICollectionViewFlowLayout *layout;
@end

@implementation HJStatusPhotoView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView {
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.scrollEnabled = NO;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellReuseIndentify];
    [self addSubview:self.collectionView];
}
- (void)setPhotoes:(NSArray *)photoes {
    _photoes = photoes;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [self.collectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoes.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIndentify forIndexPath:indexPath];
    
    HJPhoto *photo = self.photoes[indexPath.item];
    if (cell.backgroundView) {
        UIImageView *imageV = (UIImageView *)cell.backgroundView;
        [imageV sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    } else {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;//
        imageV.clipsToBounds = YES;
        [imageV sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        cell.backgroundView = imageV;
    }
    return cell;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.width == 0) {
        return;
    }
    CGFloat photosW = (self.width - 2 * 10) / 3 ;
//    self.layout.minimumInteritemSpacing = 10;
//    self.layout.minimumLineSpacing = 10;
    if (self.photoes.count == 1) {
        photosW = self.width;
    }
    if (self.photoes.count == 4) {
        photosW = (self.width -10) / 2;
    }
    self.layout.itemSize = CGSizeMake(photosW, photosW);
    self.collectionView.frame = CGRectMake(0, 0, self.width, self.height);
}

@end
