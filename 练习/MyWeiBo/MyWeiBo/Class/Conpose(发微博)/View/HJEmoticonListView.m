//
//  HJEmoticonListView.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/28.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJEmoticonListView.h"
#import "HJEmoticon.h"
#import "HJEmoticonCell.h"
#import "HJEmoticonPopView.h"
#define kEmoticonIndentify @"HJEmoticonCell"

@interface HJEmoticonListView ()<UICollectionViewDataSource, UICollectionViewDelegate
>
/**page*/
@property (nonatomic, strong)UIPageControl  *pageControl;

/**collection*/
@property (nonatomic, strong)UICollectionView  *collectionView;
/**layout*/
@property (nonatomic, strong)UICollectionViewFlowLayout  *layout;

/**表情弹出视图*/
@property (nonatomic, strong)HJEmoticonPopView  *popView;
@end

@implementation HJEmoticonListView
- (HJEmoticonPopView *)popView {
    if (!_popView) {
        _popView = [HJEmoticonPopView popView];
    }
    return _popView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平方向
    
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        //注册单元格
        [self.collectionView registerClass:[HJEmoticonCell class] forCellWithReuseIdentifier:kEmoticonIndentify];
        self.collectionView.pagingEnabled = YES;
        self.collectionView.showsHorizontalScrollIndicator = NO; 
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
        
        self.pageControl = [[UIPageControl alloc] init];
        [self addSubview:self.pageControl];
//        self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_keyboard_dot_selected"]];
//        self.pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_keyboard_dot_normal"]];
        //私有属性
        self.pageControl.backgroundColor = [UIColor whiteColor];
        [self.pageControl setValue:[UIImage imageNamed:@"compose_keyboard_dot_normal"] forKeyPath:@"pageImage"];
        [self.pageControl setValue:[UIImage imageNamed:@"compose_keyboard_dot_selected"] forKeyPath:@"currentPageImage"];
    }
    return self;
}
#pragma - mark UICollectViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 21 * ((self.emoticons.count + 20) / 21);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HJEmoticonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kEmoticonIndentify forIndexPath:indexPath];
    if (indexPath.item < self.emoticons.count) {
        cell.emoticon = self.emoticons[indexPath.item];
    } else {
        cell.emoticon = nil;
    }
    return cell;
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kEmoticonIndentify forIndexPath:indexPath];
//    UIImageView *imageV = [[UIImageView alloc] init];
//    cell.backgroundColor = [UIColor whiteColor];
//    if (indexPath.item < self.emoticons.count) {
//        HJEmoticon *emoticon = self.emoticons[indexPath.item];
//        if (emoticon.png.length != 0) {
//            imageV.image = [UIImage imageNamed:emoticon.png];
//        } else {
//            imageV.image = [UIImage imageNamed:[emoticon.code emoji]];
//        }
//        
//    }
//    cell.backgroundView = imageV;
//    return cell;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.pageControl.frame = CGRectMake(0, self.height - 30, self.width, 30);
    self.collectionView.frame = CGRectMake(0, 0, self.width, self.height - 30);
    self.layout.itemSize = CGSizeMake(self.width / 10, self.width / 10);
    self.layout.sectionInset = UIEdgeInsetsMake(10, self.width / 10 * 3 / 14, 10, self.width / 10 * 3 / 14);
    self.layout.minimumInteritemSpacing = self.width / 10 * 3 / 7;
    self.layout.minimumLineSpacing = self.width / 10 * 3 / 7;
}
- (void)setEmoticons:(NSArray *)emoticons {
    _emoticons = emoticons;
    self.pageControl.numberOfPages = (emoticons.count + 20) / 21;
    [self.collectionView reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (self.collectionView.contentOffset.x + 0.5)/ self.collectionView.width;
    self.pageControl.currentPage = page;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item >= self.emoticons.count) {
        return;
    }
    HJEmoticon *emoticon = self.emoticons[indexPath.item];
    //显示大图
    [[[UIApplication sharedApplication].windows lastObject] addSubview:self.popView];
    HJEmoticonCell *cell = (HJEmoticonCell *)[collectionView cellForItemAtIndexPath:indexPath];

    //坐标转换
    CGRect frame = [cell convertRect:cell.bounds toView:nil];
    
    self.popView.y = CGRectGetMidY(frame) - self.popView.height;
    self.popView.centerX = CGRectGetMidX(frame);
    [self.popView configEmoticon:emoticon];
    //block
    if (self.emoticonHasClick) {
        self.emoticonHasClick(emoticon);
    }
}
@end
