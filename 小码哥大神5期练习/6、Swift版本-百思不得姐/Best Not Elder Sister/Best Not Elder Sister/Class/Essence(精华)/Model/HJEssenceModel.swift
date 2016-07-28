//
//  HJEssenceModel.swift
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

class HJEssenceModel: NSObject {
    
    var bimageuri: String = ""
    var bookmark: Int = 0
    var cache_version: Int = 0
    var cai: Int = 0
    var cdn_img: String = ""
    var comment: Int = 0
    /**创建时间*/
    var create_time: String = ""
    var create_at: String = ""
    var ding: Int = 0
    var favourite = 0
    var gifFistFrame: String = ""
    var hate: Int = 0
    var height: CGFloat = 0
    var id: Int = 0
    var image0: String = ""
    var image1: String = ""
    var image2: String = ""
    var is_git: Bool = false
    var love: Int = 0
    var name: String = ""
    var original_pid: Int = 0
    var passtime: String = ""
    var profile_image: String = ""
    var repost: Int = 0
    var screen_name: String = ""
    var status: Int = 0
    var t: Int = 0
    var tag: String = ""
    var text: String = ""
    var theme_id: Int = 0
    var theme_name: String = ""
    var theme_type: Int = 0
//    var themes: Array() = Array()
//    var top_emt: Array() = Array()
    var type: Int = 1
    var user_id: Int = 0
    var videotime: Int = 0
    var videouri: String = ""
    var voicelength: Int = 0
    var voicetime: Int = 0
    var voiceuri: String = ""
    var weixin_url = ""
    var width: CGFloat = 0
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    override func setNilValueForKey(key: String) {
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
    //计算属性
    var pictureSize: CGSize {
        let w = kHJMainScreenWidth - 2 * 20
        let h = self.height * w / self.width
        
        return CGSizeMake(w, h >= 1000 ? 250 : h)
    }
    
}
