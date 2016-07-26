//
//  HJNoDataView.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/25.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import SnapKit


class HJNoDataView: UIView {
    typealias hj_NoDataClosure = () -> Void
    
    private let title: String
    private let details: String
    private let image: String
    private let buttonTitle: String
    private var buttonHasClick: hj_NoDataClosure
    
    init(title: String, details: String, image: String, buttonTitle: String, buttonHasClick: hj_NoDataClosure) {
        self.title = title
        self.details = details
        self.image = image
        self.buttonTitle = buttonTitle
        self.buttonHasClick = buttonHasClick
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        self.configSubview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**显示*/
    func showInView(view: UIView) -> Void {
        view.addSubview(self)
        self.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
    }
    
    /**隐藏*/
    func dismiss() -> Void {
        self.removeFromSuperview()
    }
    
    deinit {
        HJLog("\(self.classForCoder)释放了")
    }
    
    /**布局*/
    private func configSubview() {
        
        self.addSubview(imageV)
        imageV.snp_makeConstraints(closure: { (make) -> Void in
            make.size.equalTo(CGSizeMake(80, 80))
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY).offset(-80)
        })
        
        self.addSubview(self.titleL)
        titleL.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.bottom.equalTo(imageV.snp_top).offset(-50).priorityLow()
            make.top.greaterThanOrEqualTo(self).offset(84).priorityHigh()
        })

        self.addSubview(detailsL)
        detailsL.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(imageV.snp_bottom).offset(40)
        })
        
        
        self.addSubview(operationB)
        operationB.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(detailsL.snp_bottom).offset(40)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSizeMake(200, 30))
            
        })
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.superview!)
        }
    }
    
    //MARK:懒加载
    /**图片*/
    private lazy var imageV: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: self.image))
        return imageView
    }()
    
    /**标题*/
    private lazy var titleL: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = self.title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFontOfSize(25)
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.blackColor()
        return titleLabel
    }()
    
    /**描述*/
    private lazy var detailsL: UILabel = {
        let detailsLabel = UILabel()
        detailsLabel.text = self.details
        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .Center
        detailsLabel.font = UIFont.systemFontOfSize(18)
        detailsLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        return detailsLabel
    }()
    
    /**按钮*/
    private lazy var operationB: UIButton = {
        let operationButton = UIButton(type: UIButtonType.Custom)
        operationButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        operationButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        operationButton.setTitle(self.buttonTitle, forState: .Normal)
        operationButton.setTitle(self.buttonTitle, forState: .Highlighted)
        operationButton.setBackgroundImage(UIImage(named: "friendsTrend_login_click"), forState: .Highlighted)
        operationButton.setBackgroundImage(UIImage(named: "FollowBtnClickBg"), forState: .Normal)
        operationButton.layer.cornerRadius = 5
        operationButton.layer.borderWidth = 1
        operationButton.layer.borderColor = UIColor.redColor().CGColor
        operationButton.addTarget(self, action: "buttonHasClick:", forControlEvents: .TouchUpInside)
        return operationButton
    }()

    internal func buttonHasClick(sender: UIButton) {
        self.buttonHasClick()
    }
}
