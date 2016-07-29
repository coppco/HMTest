//
//  HJConcernController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJConcernController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigation()
        let noData = HJNoDataView(title: "温馨提示", details: "快快登录吧,关注百思最牛人\n好友动态让你过把瘾!~\n欧耶~~~!", image: "header_cry_icon", buttonTitle: "立即登录注册") {[unowned self] () -> Void in
            self.presentViewController(HJLoginRegistController(), animated: true, completion: { () -> Void in
                
            })
        }
        noData.showInView(self.view)

    }

    func settingNavigation() {
        navigationItem.title = "我的关注"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "friendsRecommentIcon", highlightedImage: "friendsRecommentIcon-click", target: self, action: "gotoRecommend")
    }
    
    func gotoRecommend() {
        navigationController?.pushViewController(HJRecommendController(), animated: true)
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
