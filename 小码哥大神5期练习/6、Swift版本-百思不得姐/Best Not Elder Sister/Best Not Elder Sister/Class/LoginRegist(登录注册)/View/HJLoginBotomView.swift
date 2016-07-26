//
//  HJLoginBotomView.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/7/26.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJLoginBotomView: UIView {
    /**快速登录*/
    internal lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "快速登录"
        label.numberOfLines = 1
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(16)
        return label
    }()
    /**QQ登录*/
    internal lazy var qqB: UIButton = {
        let button = UIButton(type: .Custom)
        button.setTitle("QQ登录", forState: .Normal)
        button.setTitle("QQ登录", forState: .Highlighted)
        button.setImage(UIImage(named: "login_QQ_icon"), forState: .Normal)
        button.setImage(UIImage(named: "login_QQ_icon_click"), forState: .Highlighted)
        return button
    }()
    /**Sina微博登录*/
    internal lazy var sinaB: UIButton = {
        let button = UIButton(type: .Custom)
        button.setTitle("微博登录", forState: .Normal)
        button.setTitle("微博登录", forState: .Highlighted)
        button.setImage(UIImage(named: "login_sina_icon"), forState: .Normal)
        button.setImage(UIImage(named: "login_sina_icon_click"), forState: .Highlighted)
        return button
    }()
    /**腾讯微博登录*/
    internal lazy var tecentB: UIButton = {
        let button = UIButton(type: .Custom)
        button.setTitle("腾讯微博", forState: .Normal)
        button.setTitle("腾讯微博", forState: .Highlighted)
        button.setImage(UIImage(named: "login_tecent_icon"), forState: .Normal)
        button.setImage(UIImage(named: "login_tecent_icon_click"), forState: .Highlighted)
        return button
    }()
    
    internal lazy var leftLine: UIImageView = {
        let imageV = UIImageView(image: UIImage(named: "login_register_left_line"))
        return imageV
    }()
    internal lazy var rightLine: UIImageView = {
        let imageV = UIImageView(image: UIImage(named: "login_register_right_line"))
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.hj_randomColor()
        self.addSubview(titleL)
        titleL.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSizeMake(80, 30))
        }
        
        self.addSubview(leftLine)
        leftLine.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(titleL.snp_left).offset(-5)
            make.centerY.equalTo(titleL)
            make.left.equalTo(20)
        }
        
        self.addSubview(rightLine)
        rightLine.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(titleL.snp_right).offset(5)
            make.centerY.equalTo(titleL)
            make.right.equalTo(-20)
        }
        
        self.addSubview(qqB)
        self.addSubview(sinaB)
        self.addSubview(tecentB)
        qqB.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.bottom.equalTo(self.snp_bottom).offset(-20)
            make.right.equalTo(sinaB.snp_left)
            make.top.equalTo(titleL.snp_bottom).offset(20)
        }
        
        sinaB.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(0)
            make.right.equalTo(tecentB.snp_left)
            make.centerY.equalTo(qqB)
        }
        
        tecentB.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(0)
            make.right.equalTo(0)
            make.centerY.equalTo(qqB)
        }
        
    }
    
}
