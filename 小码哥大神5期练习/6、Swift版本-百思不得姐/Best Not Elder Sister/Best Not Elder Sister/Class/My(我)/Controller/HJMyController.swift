//
//  HJMyController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJMyController: UIViewController {

    var settingBarButton: UIBarButtonItem?
    var moonBarButton: UIBarButtonItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "我的"
        moonBarButton = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "mine-moon-icon", highlightedImage: "mine-moon-icon-click", target: self, action: "setMoon")
        settingBarButton = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "mine-setting-icon", highlightedImage: "mine-setting-icon-click", target: self, action: "gotoNext:")
        self.navigationItem.rightBarButtonItems = [moonBarButton!, settingBarButton!]
    }
    
    func gotoNext(sender: UIButton) {
        self.navigationController?.pushViewController(HJSettingController(), animated: true)
    }
    func setMoon() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
