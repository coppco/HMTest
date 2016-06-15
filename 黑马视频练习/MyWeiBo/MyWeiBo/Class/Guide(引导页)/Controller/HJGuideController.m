//
//  HJGuideController.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/9.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJGuideController.h"
#define kGuideNum 4
#define kGuideIndentify @"GuideCell"
#import "HJTabBarController.h"

@interface HJGuideController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong)UICollectionView  *collection;
@property (nonatomic, strong)UICollectionViewFlowLayout  *layout;
@property (nonatomic, strong)NSMutableArray  *images;//图片
@property (nonatomic, strong)UIPageControl  *pageControl;
@property (nonatomic, strong)UIButton  *beginB;  //开始微博
@property (nonatomic, strong)UIButton  *shareB; //分享按钮
@end

@implementation HJGuideController
- (UIButton *)beginB {
    if (!_beginB) {
        _beginB = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_beginB setTitle:@"开始微博" forState:(UIControlStateNormal)];
        [_beginB setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_beginB setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:(UIControlStateHighlighted)];
        [_beginB setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:(UIControlStateNormal)];
        [_beginB addTarget:self action:@selector(shareB:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _beginB;
}
- (UIButton *)shareB {
    if (!_shareB) {

        _shareB = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _shareB.adjustsImageWhenHighlighted = NO; //长按变灰效果去掉
        [_shareB setTitle:@"分享给大家" forState:(UIControlStateNormal)];
        [_shareB setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_shareB setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:(UIControlStateNormal)];
        [_shareB addTarget:self action:@selector(shareB:) forControlEvents:(UIControlEventTouchUpInside)];
        [_shareB setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:(UIControlStateSelected)];
        _shareB.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        _shareB.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    }
    return _shareB;
}
- (void)shareB:(UIButton *)btn {
    if (btn == self.shareB) {
        btn.selected = !btn.selected;
    } else {
        NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
        [userD setObject:[HJTool getCFBundleVersonFromNSBundle] forKey:@"CFBundleVersion"];
        [userD synchronize];
        [HJTool animationGradualForView:self.collection type:(AnimateTypeBig) isRotateFow:YES delegate:self];
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getImages];
    [self configCollectionViewAndPageControl];
   
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //跳转
    getAppWindow().rootViewController = [[HJTabBarController alloc] init];
    if (ISIOS_8_0) {
        //注册通知
        UIUserNotificationSettings* settings=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    } else {
        UIRemoteNotificationType type = UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:type];
    }
}
- (void)getImages {
    self.images = [NSMutableArray array];
    for (int  i = 0;  i < kGuideNum; i++) {
        NSString *str = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        [self.images addObject:str];
    }
}
- (void)configCollectionViewAndPageControl {
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake(KMainScreenWidth, KMainScreenHeight);
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    
    self.collection = [[UICollectionView alloc] initWithFrame:KMainScreenBounds collectionViewLayout:self.layout];
    self.collection.pagingEnabled = YES;
    self.collection.showsHorizontalScrollIndicator = NO;
    self.collection.bounces = NO;  //边界回弹为NO
    
    //注册单元格
    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kGuideIndentify];
    
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.view addSubview:self.collection];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = kGuideNum;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    [self.view addSubview:self.pageControl];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-20);
        make.left.right.mas_equalTo(self.view);
    }];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = self.collection.contentOffset.x / self.collection.width;
    self.pageControl.currentPage = page;
}
#pragma mark - UICollectionViewDataSource和UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kGuideNum;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGuideIndentify forIndexPath:indexPath];
    UIImage *image = [UIImage imageNamed:self.images[indexPath.item]];
    UIImageView *imageV = [cell viewWithTag:9999];
    if (!imageV) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:KMainScreenBounds];
        imageV.image = image;
        imageV.tag = 9999;
        imageV.userInteractionEnabled = YES;
        [cell.contentView addSubview:imageV];
    }
    imageV.image = image;

    if (indexPath.row == kGuideNum - 1) {
        [imageV addSubview:self.beginB];
        [imageV addSubview:self.shareB];
        self.shareB.hidden = NO;
        self.beginB.hidden = NO;
        [self.shareB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(imageV);
            make.centerY.mas_equalTo(imageV).offset(50);
            make.left.right.mas_equalTo(imageV);
            make.height.mas_equalTo(30);
        }];
        [self.beginB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(imageV);
            make.centerY.mas_equalTo(self.shareB).offset(40);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
        }];
    } else if (indexPath.row % 2 == (kGuideNum % 2) ? 0 : 1){
        //判断  和最后一页相隔2个的都让它隐藏
        self.shareB.hidden = YES;
        self.beginB.hidden = YES;
    }
    return cell;
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
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
