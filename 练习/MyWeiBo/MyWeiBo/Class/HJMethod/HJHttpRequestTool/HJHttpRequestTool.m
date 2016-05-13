//
//  HJHttpRequestTool.m
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJHttpRequestTool.h"
#import <AFNetworking.h>

@implementation HJHttpRequestTool
+ (NSString *)wipeSpecialStringWithURL:(NSString *)url {
    //去除url中的空格
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    //url中有汉字 需要编码
    //对应解码方法:解码使用stringByRemovingPercentEncoding方法
    if ([HJTool stringIsContainerChineseCharacter:url]) {
        if (ISIOS_7_0) {
            url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        } else {
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return url;
}

+ (void)requestWithType:(HJHttpRequestType)networkType
              URLString:(NSString *)urlString
                 params:(NSDictionary *)params
                showHUD:(BOOL)showHUD
               progress:(HJProgress)progress
                success:(HJResponseSuccess)success
                 failed:(HJResponseFailed)failed
{
    //去掉空格和特殊字符串 汉字编码
    urlString = [self wipeSpecialStringWithURL:urlString];
    
    //1⃣️请求管理类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2⃣️设置返回格式 默认JSON支持
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    //3⃣️设置请求类型,默认HTTP
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;  //请求时间30s, 默认60s
    manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;  //默认缓存策略
    /*
     //4⃣️添加header头信息, 需要根据具体情况添加
     srand((unsigned)time(0));  //随机种子
     NSString *noncestr = STRFORMAT(@"%d", rand()); //随机串
     NSString *timeStamp = [HJCommonTools getTimestampWithType:TimestampTpyeMillisecond]; //时间戳
     NSString *signture = STRFORMAT(@"%@%@%@", ServerAPPKey, noncestr, timeStamp);
     [session.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];   //置请求内容的类型   json数据,使用utf-8编码
     [session.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];//接收类型
     [session.requestSerializer setValue:noncestr forHTTPHeaderField:@"nonce"];  //随机串
     [session.requestSerializer setValue:timeStamp forHTTPHeaderField:@"timestamp"]; //时间戳
     [session.requestSerializer setValue:[HJCommonTools returnAStringWithEncryptType:EncryptTypeSHA256 forString:signture] forHTTPHeaderField:@"sign"];
     */
    //5⃣️开始请求
    switch (networkType) {
        case HJHttpRequestTypeGET:
        {
            [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                if (progress) {
                    progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failed) {
                    failed(error);
                }
            }];
        }
            break;
        case HJHttpRequestTypePOST:
        {
            [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                if (progress) {
                    progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failed) {
                    failed(error);
                }
            }];
        }
            break;
    }
}
//上传图片
+ (void)uploadImagesURLString:(NSString *)urlString
                       params:(NSDictionary *)params
                       images:(NSDictionary *)images
                      showHUD:(BOOL)showHUD
                     progress:(HJProgress)progress
                      success:(HJResponseSuccess)success
                       failed:(HJResponseFailed)failed

{
    //去掉空格和特殊字符串 汉字编码
    urlString = [self wipeSpecialStringWithURL:urlString];
    
    //1⃣️请求管理类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2⃣️设置返回格式 默认JSON支持
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    //3⃣️设置请求类型,默认HTTP
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;  //请求时间30s, 默认60s
    manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;  //默认缓存策略
    /*
     //4⃣️添加header头信息, 需要根据具体情况添加
     srand((unsigned)time(0));  //随机种子
     NSString *noncestr = STRFORMAT(@"%d", rand()); //随机串
     NSString *timeStamp = [HJCommonTools getTimestampWithType:TimestampTpyeMillisecond]; //时间戳
     NSString *signture = STRFORMAT(@"%@%@%@", ServerAPPKey, noncestr, timeStamp);
     [session.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];   //置请求内容的类型   json数据,使用utf-8编码
     [session.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];//接收类型
     [session.requestSerializer setValue:noncestr forHTTPHeaderField:@"nonce"];  //随机串
     [session.requestSerializer setValue:timeStamp forHTTPHeaderField:@"timestamp"]; //时间戳
     [session.requestSerializer setValue:[HJCommonTools returnAStringWithEncryptType:EncryptTypeSHA256 forString:signture] forHTTPHeaderField:@"sign"];
     */
    //🈚️开始请求
    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 图片上传
        for (NSString *nameKey in [images allKeys])
        {
            // 上传时使用当前的系统时间做为文件名
            NSDateFormatter *formatter  = [[NSDateFormatter alloc] init];
            formatter.dateFormat  = @"yyyyMMddHHmmssSSS";
            NSString *fileName = [NSString stringWithFormat:@"%@.png", [formatter stringFromDate:[NSDate date]]];
            // 上传的图片转成data格式
            UIImage *image  = [images objectForKey:nameKey];
            NSData *data    = UIImageJPEGRepresentation(image, 0.5);
            
            /**
             *  appendPartWithFileData  //  指定上传的文件
             *  name                    //  指定在服务器中获取对应文件或文本时的key
             *  fileName                //  指定上传文件的原始文件名
             *  mimeType                //  指定上传文件的MIME类型
             */
            [formData appendPartWithFileData:data name:nameKey fileName:fileName mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

@end
