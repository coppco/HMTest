//
//  HJLoginRegistController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/25.
//  Copyright © 2016年 M-coppco. All rights reserved.
//  登录、注册界面

import UIKit

class HJLoginRegistController: UIViewController {

    /**背景图*/
    internal lazy var backGroundImage:UIImageView = {
        let imageV = UIImageView(image: UIImage(named: "login_register_background"))
        return imageV
    }()
    
    /**返回按钮*/
    internal lazy var backButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        button.setBackgroundImage(UIImage(named: "login_close_icon"), forState: .Normal)
        button.addTarget(self, action: "back:", forControlEvents: .TouchUpInside)
        return button
    }()
    
    //底部
    internal lazy var bottomView: HJLoginBotomView = {
        let view = HJLoginBotomView(frame: CGRectZero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.view.addSubview(backGroundImage)
        backGroundImage.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        self.view.addSubview(backButton)
        backButton.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSizeMake(16, 16))
            make.top.left.equalTo(UIEdgeInsetsMake(40, 25, 0, 0))
        }
        
        self.view.addSubview(bottomView)
        bottomView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.bottom.equalTo(self.view.snp_bottom).offset(-20)
            //这里不设置高度,内部控件已经设置好了约束
//            make.height.equalTo(self.view.hj_height * 0.3)
        }
    }
    
    //返回
    func back(sender: UIButton) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            sender.transform = CGAffineTransformRotate(sender.transform, CGFloat(-M_PI_2) / 2.0)
            }) { (flag) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    //状态栏颜色
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
