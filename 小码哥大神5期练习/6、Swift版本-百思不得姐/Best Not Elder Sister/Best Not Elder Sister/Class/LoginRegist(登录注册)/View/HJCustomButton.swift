//
//  HJCustomButton.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/26.
//  Copyright © 2016年 M-coppco. All rights reserved.
//   QQ登录按钮

import UIKit

class HJCustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.titleLabel?.textAlignment = .Center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        self.backgroundColor = UIColor.hj_randomColor()
        super.layoutSubviews()
        let padding: CGFloat = 5  //间隔
        let minValue = min(self.hj_height * 0.8, self.hj_width) - padding
        self.imageView?.frame = CGRectMake((self.hj_width - minValue) / 2, 0, minValue, minValue)
        self.titleLabel?.frame = CGRectMake(0, (self.imageView?.hj_maxY)! + padding, self.hj_width, self.hj_height - (imageView?.hj_height)! - padding)
    }
    deinit {
        HJLog(self.classForCoder, "释放了")
    }
}
