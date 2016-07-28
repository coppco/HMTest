//
//  HJEssenceTCell.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/7/28.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import Kingfisher

class HJEssenceTCell: UITableViewCell {

    //MARK: 监听
     var tModel: HJEssenceModel? {
        didSet (new){
            self.nameL.text = tModel!.name
            self.create_timeL.text = tModel!.create_time
            self.iconImageV.kf_setImageWithURL(NSURL(string: (tModel?.profile_image)!)!, placeholderImage: UIImage(named: "defaultUserIcon"))
            self.contentL.text = tModel?.text
            
            if let type = tModel?.type {
                switch type {
                case 10:
                    self.contentView.addSubview(pictureV)
                    self.pictureV.model = tModel
                    print(tModel?.pictureSize)
                    pictureV.snp_remakeConstraints(closure: { (make) -> Void in
                        make.centerX.equalTo(self)
                        make.size.equalTo((tModel?.pictureSize)!)
                        make.top.equalTo(self.contentL.snp_bottom).offset(2 * paddingV)
                    })
                default: break
                }
            }
            
            self.bottomBar.snp_remakeConstraints { (make) -> Void in
                make.top.equalTo(pictureV.snp_bottom)
                make.left.right.equalTo(0)
                make.height.equalTo(44)
                make.bottom.equalTo(self.contentView).offset(-paddingV)
            }
            
        }
    }
    
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    func configUI() {
        self.contentView.addSubview(iconImageV)
        self.contentView.addSubview(nameL)
        self.contentView.addSubview(create_timeL)
        self.contentView.addSubview(bottomBar)
        self.contentView.addSubview(moreButton)
        self.contentView.addSubview(contentL)
        
        
        iconImageV.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(iconBeginX)
            make.top.equalTo(iconBeginY)
            make.size.equalTo(CGSizeMake(40, 40))
        }
        
        nameL.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconImageV)
            make.height.equalTo(create_timeL)
            make.left.equalTo(iconImageV.snp_right).offset(paddingH)
            make.bottom.equalTo(create_timeL.snp_top)
        }
        create_timeL.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(nameL)
            make.bottom.equalTo(iconImageV.snp_bottom)
        }
        
        moreButton.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(iconImageV)
            make.right.equalTo(-iconBeginX)
        }
        
        contentL.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconImageV.snp_bottom).offset(paddingV * 2)
            make.left.equalTo(iconBeginX)
            make.right.equalTo(-iconBeginX)
        }
        
        
        
        bottomBar.snp_makeConstraints { (make) -> Void in
            make.right.left.equalTo(self)
            make.height.equalTo(44)
            make.bottom.equalTo(self).offset(-paddingV)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: 一些设置
    let iconBeginX = 20
    let iconBeginY = 10
    let paddingH = 8
    let paddingV = 5
}
