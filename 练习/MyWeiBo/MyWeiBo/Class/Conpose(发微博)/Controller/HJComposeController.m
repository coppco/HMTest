//
//  HJComposeController.m
//  MyWeiBo
//
//  Created by M-coppco on 16/5/23.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJComposeController.h"
#import "HJAccountTool.h"
#import "HJAccount.h"
#import "HJTextView.h"  //带占位符的textView
#import "HJComposeTool.h"  //工具条
#import <AssetsLibrary/AssetsLibrary.h> //检测相册访问权限
#import <AVFoundation/AVFoundation.h>//检测摄像头访问权限

@interface HJComposeController ()<UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong)HJTextView  *textView;
@property (nonatomic, strong)HJComposeTool  *toolbar;
@property (nonatomic, strong)UIImage  *image;
@end

@implementation HJComposeController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self.textView becomeFirstResponder];
}
/*监听键盘通知*/
- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSTimeInterval animationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]; //动画时间
    UIViewAnimationOptions animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect endKeyBoardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //动画
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationCurve animations:^{
        [self.toolbar setY:endKeyBoardFrame.origin.y - self.toolbar.height];
    } completion:^(BOOL finished) {
    }];
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //scrollvie会自动适应contentInset
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self configNavigationBarButtonItem];
    [self initSubView];
    
}
#pragma mark - 初始化方法
- (void)initSubView {
    self.textView = [[HJTextView alloc] init];
    self.textView.font = [UIFont boldSystemFontOfSize:17];
    self.textView.textContainerInset = UIEdgeInsetsMake(8, 5, 5, 5); //设置文字边框
    self.textView.alwaysBounceVertical = YES;  //垂直方向一直弹簧效果
    self.textView.frame = self.view.bounds;
    self.textView.delegate = self;
    self.textView.placeholder = @"分享新鲜事…";
    [self.view addSubview:self.textView];

    //函数响应式编程
    RAC(self.navigationItem.rightBarButtonItem, enabled) = [RACSignal combineLatest:@[self.textView.rac_textSignal] reduce:^id (NSString *text){
        return @(text.length != 0);
    }];
    
    //工具条
    self.toolbar = [HJComposeTool toolbar];
    [self.view addSubview:self.toolbar];
    self.toolbar.frame = CGRectMake(0, KMainScreenHeight - 44, KMainScreenWidth, 44);
    //工具条的block方法
    WeakSelf(weak);
    [self.toolbar setPictureButtonHasClicked:^(HJComposeTool *tool, UIButton *button) {
        [weak openUIImagePickerControllerWithType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    }];
    
    [self.toolbar setCameraButtonHasClicked:^ (HJComposeTool *tool, UIButton *button) {
        //查看权限能否使用
        [weak openUIImagePickerControllerWithType:(UIImagePickerControllerSourceTypeCamera)];
    }];

}
- (void)configNavigationBarButtonItem {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(dismiss:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发微博" style:(UIBarButtonItemStylePlain) target:self action:@selector(dismiss:)];
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.size = CGSizeMake(150, 44);
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.numberOfLines = 0;
    NSString *userName = [HJAccountTool getAccount].name;
    if (userName.length != 0) {
        NSString *str = STR(@"发微博\n%@", userName);
        //可变的
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:str];
        //后面的字体
        [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(4, [HJAccountTool getAccount].name.length)];
        [title addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, [HJAccountTool getAccount].name.length)];
        
        titleL.attributedText = title;
        self.navigationItem.titleView = titleL;
    } else {
        self.navigationItem.title = @"发微博";  
    }

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.textView resignFirstResponder];
}
#pragma mark - 按钮方法
- (void)dismiss:(UIBarButtonItem *)button {
    if (button == self.navigationItem.leftBarButtonItem) {
        [self.textView resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self sendRequestStatus]; //发微博
    }
}
- (void)sendRequestStatus {
    [self.view endEditing:YES];
    /*
     access_token	true	string	采用OAuth授权方式为必填参数
     status	true	string	要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。
     pic  binary  二进制
     */
    NSDictionary *params = @{@"access_token":[HJAccountTool getAccount].access_token, @"status":self.textView.text};
    if (!self.textView.image) {
        NSString *url1 = @"https://api.weibo.com/2/statuses/update.json";
        [HJHttpRequestTool requestWithType:(HJHttpRequestTypePOST) URLString:url1 params:params showHUD:NO progress:nil success:^(id response) {
            [MBProgressHUD showSuccess:@"发送成功"];
        } failed:^(NSError *error) {
            [MBProgressHUD showSuccess:@"发送失败"];
        }];
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
  
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:getAppWindow()];
    hud.labelText = @"正在上传图片";
    [self.view addSubview:hud];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    [hud show:YES];
    
    NSString *url = @"https://upload.api.weibo.com/2/statuses/upload.json";
    [HJHttpRequestTool uploadImagesURLString:url params:params images:@{@"pic":self.image} showHUD:NO progress:^(int64_t completeProgress, int64_t totalProgress) {
        hud.progress = completeProgress  * 1.0 / totalProgress;
        
    } success:^(id response) {
        [hud hide:YES];
         [self dismissViewControllerAnimated:YES completion:nil];
    } failed:^(NSError *error) {
        [hud hide:YES];
         [self dismissViewControllerAnimated:YES completion:nil];
    }];
   
}
#pragma mark - UIImagePicker
- (void)openUIImagePickerControllerWithType:(UIImagePickerControllerSourceType)type {
    [self hasAuthority:type];
    //不能用返回
    if (![UIImagePickerController isSourceTypeAvailable:(type)]) {
        [MBProgressHUD showError:@"请确保相机能够使用"];
        return;
    }
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = type;
    pickerVC.delegate = self;
//    pickerVC.allowsEditing = YES;
    [self presentViewController:pickerVC animated:YES completion:nil];
}
//选择完照片后调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (!image) {
        return;
    }
    self.image = image;
    self.textView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)hasAuthority:(UIImagePickerControllerSourceType)type   {
    if (UIImagePickerControllerSourceTypePhotoLibrary == type || UIImagePickerControllerSourceTypeSavedPhotosAlbum == type) {
        ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
        if (ALAuthorizationStatusRestricted == status || ALAuthorizationStatusDenied == status) {
            //打开设置
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    } else if (UIImagePickerControllerSourceTypeCamera == type) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
            //打开设置
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }
    
}
@end
