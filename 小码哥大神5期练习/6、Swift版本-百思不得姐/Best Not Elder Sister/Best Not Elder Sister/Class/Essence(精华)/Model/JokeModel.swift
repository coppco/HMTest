//
//  JokeModel.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/28.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit


//段子类型
enum JOKEType: Int {
    case All = 1
    case Video = 41
    case Sound = 31
    case Picture = 10
    case Word = 29
}

class JokeModel: NSObject {
    
    /**改变key*/
    override class func changKeys() -> [String: String]? {
        return ["":""]
    }
    /**数组中存放model*/
    override class func CustomerInArray() ->  [String: String]?{
        return ["tags":"Tags", ]
    }

    
    /***/
    var bookmark: Int?
    /**评论*/
    var comment: Int?
    /**踩*/
    var down: Int?
    var forward: Int?
    var id: UInt32?
    /**创建时间*/
    var passtime: String?
    /**分享url*/
    var share_url: String?
    var status: Int?
    /**标签*/
    var tags: [Tags]?
    /**正文*/
    var text: String?
    /**热评*/
    var top_comments: Top_comments?
    /**用户信息*/
    var u: User?
    /**顶*/
    var up: UInt32?
    /**类型vedio, image, gif, text等*/
    var type: String?
    /**video信息*/
    var video: Video?
    /**图片信息*/
    var image: Image?
    /**gif信息*/
    var gif: Gif?
    var precmt: Precmt? 

    
}

/**标签*/
class Tags: NSObject {
    var id: UInt32?
    var name: String?
}

class User: NSObject {
    /**头像数组*/
    var header: [String]?
    /**是否大v*/
    var is_v: Bool?
    /**是否vip*/
    var is_vip: Bool?
    /**用户名称*/
    var name: String?
    /**用户id*/
    var uid: UInt32?
    var sex: String?
}

class Video: NSObject {
    /**下载地址*/
    var download: [String]?
    /**时长*/
    var duration: UInt32?
    /**高*/
    var height: UInt32?
    /**宽*/
    var width: UInt32?
    /**播放次数*/
    var playcount: UInt32?
    /**收藏次数*/
    var playfcount: UInt32?
    /**图片*/
    var thumbnail: [String]?
    var video: [String]?
}

class Top_comments: NSObject {
    var content: String?
    var id: UInt32?
    var like_count: UInt32?
    var passtime: String?
    var precid: UInt32?
    var preuid: UInt32?
    var u: User?
    var voicetime: UInt32?
    var voiceuri: String?
}

class Image: NSObject {
    var big: [String]?
    var download: [String]?
    var height: UInt32?
    var width: UInt32?
    var medium: [String]?
    var small: [String]?
}

class Gif: NSObject {
    var download_url: [String]?
    var gif_thumbnail: [String]?
    var images: [String]?
    var height: UInt32?
    var width: UInt32?
}

class Precmt: NSObject {
    var content: String?
    var id: UInt32?
    var like_count: UInt32?
    var passtime: String?
    var precid: UInt32?
    var preuid: UInt32?
    var u: User?
    var voicetime: UInt32?
    var voiceuri: String?
}