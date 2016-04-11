//
//  ViewController.m
//  05-画板
//
//  Created by M-coppco on 16/4/6.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "HJDrawView.h"
#import "MBProgressHUD+MJ.h"
#import "HJShowView.h"

@interface ViewController ()<UINavigationControllerDelegate, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet HJDrawView *drawView;
@property (nonatomic, strong)HJShowView *showView;
@end

@implementation ViewController
//滑块
- (IBAction)sliderChange:(UISlider *)sender {
    _drawView.lineWidth = sender.value;
}
//颜色
- (IBAction)color:(UIButton *)sender {
    _drawView.color = sender.backgroundColor;
}
//清屏
- (IBAction)clean:(UIBarButtonItem *)sender {
    [_drawView cleanScreen];
}
//撤销
- (IBAction)undo:(id)sender {
    [_drawView undo];
}
//橡皮擦
- (IBAction)xiangpicha:(id)sender {
    _drawView.color = [UIColor whiteColor];
}
//照片
- (IBAction)photo:(id)sender {
    //照片选择器
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    /*
    _drawView.drawImage = image;
     */
    [_showView removeFromSuperview];
    _showView = [[HJShowView alloc] initWithFrame:self.drawView.frame];
    _showView.image = image;
    _showView.imageBlock = ^(UIImage *image) {
        _drawView.drawImage = image;
    };
    [self.view addSubview:_showView];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//保存
- (IBAction)save:(id)sender {
    //保存到用户相册
    UIImage *image = [_drawView quickImage
                      ];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//保存到相册回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        //失败
        [MBProgressHUD showError:@"保存失败"];
    } else {
        //成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
