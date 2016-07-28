//
//  HJHttpRequest.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/27.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


func httpRequestJSON(
    type: Alamofire.Method,
    URLString: String,
    parameters: [String: AnyObject]? = nil,
    encoding: ParameterEncoding = .URL,
    headers: [String: String]? = nil, success: (object: JSON) -> Void, failed: (error: NSError) -> Void) -> Request{
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let request: Request = Alamofire.request(type, URLString, parameters: parameters, encoding: encoding, headers: headers)

        request.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                if let data = response.result.value {
                    success(object: JSON(data))
                } else {
                    failed(error: NSError(domain: "数据异常", code: 44, userInfo: nil))
                }
                
            } else {
                if let error = response.result.error {
                    failed(error: error)
                } else {
                    failed(error: NSError(domain: "数据异常", code: 44, userInfo: nil))
                }
            }
           UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        HJLog(request.request?.URL)
        return request
}




