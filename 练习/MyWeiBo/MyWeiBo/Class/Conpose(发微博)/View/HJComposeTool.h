//
//  HJComposeTool.h
//  MyWeiBo
//
//  Created by M-coppco on 16/5/24.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJComposeTool;

typedef void(^PictureBlock)(HJComposeTool *tool, UIButton *button);

typedef void(^CameraBlock)(HJComposeTool *tool, UIButton *button);

typedef void(^MentionBlock)(HJComposeTool *tool, UIButton *button);

typedef void(^TrendBlock)(HJComposeTool *tool, UIButton *button);

typedef void(^EmoticonBlock)(HJComposeTool *tool, UIButton *button);

@interface HJComposeTool : UIView
/**照片点击*/
@property (nonatomic, copy)PictureBlock pictureButtonHasClicked;
/**表情点击*/
@property (nonatomic, copy)EmoticonBlock emoticonButtonHasClicked;
/**#点击*/
@property (nonatomic, copy)TrendBlock trendButtonHasClicked;
/**相机点击*/
@property (nonatomic, copy)CameraBlock cameraButtonHasClicked;
/**@点击*/
@property (nonatomic, copy)MentionBlock mentionButtonHasClicked;
/**切换图片*/
@property (nonatomic, assign)BOOL  switchImage;
+ (instancetype)toolbar;

@end
