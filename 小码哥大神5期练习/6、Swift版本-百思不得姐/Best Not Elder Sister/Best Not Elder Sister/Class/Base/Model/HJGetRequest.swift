//
//  HJGetRequest.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/27.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJGetRequest: NSObject {
    var a: String?
    /**参数为baisishequ 分享到朋友圈时候使用*/
    var appname: String = "baisishequ"
    var asid: String = "AC824640-5493-4DAD-B356-F84136BE8A55"
    var c: String?
    var client: String? //Android  iphone
    var device: String?  // 设备
    var from: String?  //iOS
    var jbk: Int = 0  //一般为0
    /**第一次加载帖子时候不需要传入此关键字，当需要加载下一页时：需要传入加载上一页时返回值字段“maxtime”中的内容*/
    var maxtime: String?
    
    var openudid: String = "19deb9dde5ccf65fe1623b59a5ebeff55bcbc319"
    /**repost，在获取“精华”板块“排行”标签的帖子时候需要传入此参数*/
    var order: String = "repost"
    /**week，按照“周排行”的顺序进行筛选排序帖子，默认是“周排行”*/
    var time: String = "week"
    var page: Int = 0  //当前所加载的页码数，默认为0
    var per: Int = 20  //每页显示的帖子数量，默认为20
    var sub_flag: Int = 1
    var type: Int = 1  //1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    var uid: String?  //当前所登陆的用户id,如果未登录则为空
    var ver: String? //当前所安装的app的版本
}
