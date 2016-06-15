//
//  ViewController.m
//  day05查看大图
//
//  Created by M-coppco on 16/2/21.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImage *image;

@end

@implementation ViewController
- (void)setImage:(UIImage *)image {
    _image = image;
    
    //设置图像的内容
    self.imageView.image = image;
    
    //让imageView根据图像自动调整大小
    [self.imageView sizeToFit];
    
    //改变scrollView的实际大小
    self.scrollView.contentSize = image.size;
}
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.image = [UIImage imageNamed:@"minion"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
