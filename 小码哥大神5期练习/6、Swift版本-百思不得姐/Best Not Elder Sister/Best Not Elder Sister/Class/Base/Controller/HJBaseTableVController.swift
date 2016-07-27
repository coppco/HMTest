//
//  HJBaseTableVController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/25.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJBaseTableVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None  //设置为none, 不然从最上面开始
        settingNavigation()
        self.setupUI()
    }

    func settingNavigation() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "MainTagSubIcon", highlightedImage: "MainTagSubIconClick", target: self, action: "gotoNextVC")
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
    }

    func gotoNextVC() {}
    
    func setupUI() {
        self.view.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.right.left.top.equalTo(self.view)
            make.height.equalTo(50)
        }
    }

    //MARK: 
    private var topView: HJHomeTopView = {
        let view = HJHomeTopView(title: ["推荐", "视频", "图片", "段子", "网红", "排行", "社会", "美女", "冷知识", "游戏"], closure: { (title) -> Void in
            HJLog(title)
        })
        return view
    }()

}
