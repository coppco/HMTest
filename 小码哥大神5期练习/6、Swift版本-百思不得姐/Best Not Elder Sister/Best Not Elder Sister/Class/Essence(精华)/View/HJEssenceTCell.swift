//
//  HJEssenceTCell.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/7/28.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class HJEssenceTCell: UITableViewCell {


    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.tModel = nil
        self.iconImageV.image = nil
        self.nameL.text = nil
        self.create_timeL.text = nil
        self.contentL.text = nil
        self.pictureV.model = nil
    }

    
    //MARK: 监听
     var tModel: HJEssenceModel? {
        didSet {
            if let new = tModel {
                self.iconImageV.kf_setImageWithURL(NSURL(string: new.profile_image)!, placeholderImage: UIImage(named: "defaultUserIcon"))
                self.nameL.text = new.name

                self.create_timeL.text = new.create_time
                self.contentL.text = new.text
                self.pictureV.model = new


                self.setNeedsUpdateConstraints()
            }
        }
    }
    
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubview()
        setAutoLayout()
    }

    func createSubview() {
        self.contentView.addSubview(iconImageV)
        self.contentView.addSubview(nameL)
        self.contentView.addSubview(create_timeL)
        self.contentView.addSubview(moreButton)
        self.contentView.addSubview(contentL)
         self.contentView.addSubview(pictureV)
        self.contentView.addSubview(bottomBar)
    }
    
    func setAutoLayout() {
        iconImageV.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSizeMake(40, 40))
            make.left.equalTo(iconBeginX)
            make.top.equalTo(iconBeginY)
        }
        
        nameL.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(iconImageV.snp_right).offset(paddingH)
            make.top.equalTo(iconImageV.snp_top)
            make.height.equalTo(create_timeL.snp_height)
        }
        
        create_timeL.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameL.snp_bottom)
            make.left.equalTo(nameL.snp_left)
        }
        
        contentL.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.contentView).offset(iconBeginX)
            make.right.equalTo(self.contentView).offset(-iconBeginX)
            make.top.equalTo(iconImageV.snp_bottom).offset(paddingV)
        }
        
        //这个设置是重点
        pictureV.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentL.snp_bottom).offset(paddingV)
            make.left.equalTo(iconBeginX)
            make.right.equalTo(-iconBeginX)
            make.height.equalTo(250)
        }
        
        bottomBar.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(pictureV.snp_bottom).offset(paddingV)
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(44)
            make.bottom.equalTo(self.contentView).offset(-iconBeginY)
        }
        
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: 一些设置
    let iconBeginX: CGFloat = 20  //开始x坐标
    let iconBeginY: CGFloat = 10  //开始y坐标
    let paddingH: CGFloat = 8  //水平间距
    let paddingV: CGFloat = 10  //垂直间距
    
    /**头像*/
    private lazy var iconImageV: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 20
        icon.layer.masksToBounds = true
        icon.image = UIImage(named: "defaultUserIcon")
        return icon
    }()
    
    /**vip*/
    private lazy var vipImageV: UIImageView = {
        let vip = UIImageView()
        vip.image = UIImage(named: "Profile_AddV_authen")
        return vip
    }()
    /**用户名*/
    private lazy var nameL: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.redColor()
        return label
    }()
    
    /**时间*/
    private lazy var create_timeL: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.redColor()
        return label
    }()
    /**钻石*/
    private lazy var diamondImageV: UIImageView = {
        let diamond = UIImageView()
        return diamond
    }()
    
    /**点点点*/
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        button.setImage(UIImage(named: "cellmorebtnnormal"), forState: .Normal)
        button.setImage(UIImage(named: "cellmorebtnclick"), forState: .Highlighted)
        return button
    }()
    
    /**正文*/
    private lazy var contentL: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.numberOfLines = 0
        label.textColor = UIColor.blackColor()
        return label
    }()
    
    /**中间图片*/
    private lazy var pictureV: HJPictureView = {
        let view = HJPictureView()
        return view
    }()
    
    
    /**底部按钮*/
    private lazy var bottomBar: HJJokeToolBar = HJJokeToolBar(frame: CGRectZero)
    
}
