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
            make.height.equalTo(44)
        }
        
        self.view.addSubview(collectionView)

        collectionView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(topView.snp_bottom)
        }
    }

    //MARK: private
     lazy var topView: HJHomeTopView = {
        let array = ["推荐", "视频", "图片", "段子", "网红", "排行", "社会", "美女", "冷知识", "游戏"]
        let view = HJHomeTopView(title: array, closure: {[unowned self] (title, index) -> Void in
            self.changeTitle(title: title, index: index)
        })
        return view
        
    }()

    //集合视图
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSizeMake(kHJMainScreenWidth, kHJMainScreenHeight - 44 - 64 - 49)  //tabBar高度49  导航栏和状态栏 64  顶部自定义44
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        collectionView.pagingEnabled = true
        return collectionView
    }()
    

    func changeTitle(title title: String, index: Int) {
        
    }
  
}
