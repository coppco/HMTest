//
//  RequestDefine.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/27.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import Foundation
/**推荐*/
let homeRecommend: String = jokeUrlForType("1")

/**视频*/
let vedioUrl: String = jokeUrlForType("41")

/**baseURL*/
func jokeUrlForType(type: String) -> String {
    return String(format: "http://s.budejie.com/topic/list/jingxuan/%@/bs0315-iphone-4.3/0-20.json", type)
}

/**我的-推荐订阅*/
let myCommend: [String: String] = ["a": "tag_recommend","action":"sub", "c": "topic"]
/**段子*/
let joke: [String: String] = ["a": "list", "c":"data", "type": "10"]

/**我的-推荐订阅*/
//http://api.budejie.com/api/api_open.php?a=tag_recommend&action=sub&appname=bs0315&asid=6989CB04-86B2-4D2E-9A3A-FA2E6B453AB4&c=topic&client=iphone&device=ios%20device&from=ios&jbk=0&limit=50&mac=&market=&openudid=d41d8cd98f00b204e9800998ecf8427e939e99ab&type=0&udid=&ver=4.3