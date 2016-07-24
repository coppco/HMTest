//
//  HJTabBarController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJTabBarController: UITabBarController {

    override class func initialize() {
        //统一设置,一般在控件添加之前设置,在它之前已经显示的控件,需要先remove再添加
        let tabBarItem = UITabBarItem.appearance()
        //文字
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState: .Normal)
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingController(HJEssenceController(), title: "精华", image: "tabBar_essence_icon", selectImage: "tabBar_essence_click_icon")
        
        settingController(HJLastestController(), title: "最新", image: "tabBar_new_icon", selectImage: "tabBar_new_click_icon")
        
        settingController(HJConcernController(), title: "关注", image: "tabBar_friendTrends_icon", selectImage: "tabBar_friendTrends_click_icon")
        
        settingController(HJMyController(), title: "我", image: "tabBar_me_icon", selectImage: "tabBar_me_click_icon")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func settingController(controller: UIViewController, title: String, image: String, selectImage: String) {
        controller.title = title
        controller.tabBarItem.image = UIImage(named: image)
        //选择图片,默认选中的时候会有蓝色  方法1:原始图片(代码)  方法2:在Assets.xcassets中选中图片,  把Render as  选择original(Xcode)
        controller.tabBarItem.selectedImage = UIImage(named: selectImage)?.imageWithRenderingMode(.AlwaysOriginal)
        //文字
//        controller.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState: .Normal)
//        controller.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
        let navigationVC = HJNavigationController(rootViewController: controller)
        controller.view.backgroundColor = UIColor.hj_randomColor()
        self.addChildViewController(navigationVC)
    }

}
