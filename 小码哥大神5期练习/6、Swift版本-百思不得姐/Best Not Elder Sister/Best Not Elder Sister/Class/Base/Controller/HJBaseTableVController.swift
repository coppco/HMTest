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
        
    }
    
    private func settingNavigation() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "MainTagSubIcon", highlightedImage: "MainTagSubIconClick", target: self, action: "gotoNextVC")
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
    }

    func gotoNextVC() {}
    
    func setupUI() {
        self.view.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.right.left.top.equalTo(self.view)
            make.height.equalTo(44)
        }
    }

    //MARK: private
    var  topArray: [String] = [String]()
    
    lazy var topView: HJHomeTopView = {
        let view = HJHomeTopView(title: self.topArray, closure: {[unowned self] (title, index) -> Void in
            self.changeTitle(title: title, index: index)
        })
        return view
        
    }()

    func changeTitle(title title: String, index: Int) {
    }
  
}
