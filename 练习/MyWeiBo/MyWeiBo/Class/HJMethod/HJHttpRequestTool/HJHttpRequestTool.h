//
//  HJHttpRequestTool.h
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 请求类型 */
typedef NS_ENUM(NSInteger, HJHttpRequestType) {
    HJHttpRequestTypeGET,   //get请求
    HJHttpRequestTypePOST  //post请求
};
/**
 *  进度条block
 *
 *  @param completeProgress 已经完成大小
 *  @param totalProgress   总大小
 */
typedef void(^HJProgress)(int64_t completeProgress,
                          int64_t totalProgress);
/**
 *  请求成功block
 *
 *  @param response 服务器返回数据
 */
typedef void(^HJResponseSuccess)(id response);
/**
 *  网络响应失败block
 *
 *  @param error 错误信息
 */
typedef void(^HJResponseFailed)(NSError *error);

@interface HJHttpRequestTool : NSObject
/**
 *  @author XHJ, 16-03-29 16:03:13
 *
 *  网络请求, GET 和 POST
 *
 *  @param networkType 请求类型 GET和 POST
 *  @param urlString         url字符串
 *  @param params      参数
 *  @param showHUD     是否显示HUD
 *  @param progress  进度条
 *  @param success     成功的block
 *  @param failed      失败的block
 */
+ (void)requestWithType:(HJHttpRequestType)networkType
              URLString:(NSString *)urlString
                 params:(NSDictionary *)params
                showHUD:(BOOL)showHUD
               progress:(HJProgress)progress
                success:(HJResponseSuccess)success
                 failed:(HJResponseFailed)failed;

/**
 *  @author XHJ, 16-03-29 16:03:37
 *
 *  上传图片
 *
 *  @param urlString url字符串
 *  @param params    参数
 *  @param images    图片字典
 *  @param showHUD   是否显示HUD
 *  @param progress  进度条
 *  @param success   成功block
 *  @param failed    失败block
 */
+ (void)uploadImagesURLString:(NSString *)urlString
                       params:(NSDictionary *)params
                       images:(NSDictionary *)images
                      showHUD:(BOOL)showHUD
                     progress:(HJProgress)progress
                      success:(HJResponseSuccess)success
                       failed:(HJResponseFailed)failed;
@end
