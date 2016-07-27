//
//  HJMyController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import Alamofire

class HJMyController: UITableViewController {

    var settingBarButton: UIBarButtonItem?
    var moonBarButton: UIBarButtonItem?
    var square: [HJSquare]? {
        didSet {
            if let _ = square {
//                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigation()
        network()
    }
    
    func settingNavigation() {
        navigationItem.title = "我的"
        moonBarButton = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "mine-moon-icon", highlightedImage: "mine-moon-icon-click", target: self, action: "setMoon")
        settingBarButton = UIBarButtonItem.hj_barButtonItem(title: "", normalImage: "mine-setting-icon", highlightedImage: "mine-setting-icon-click", target: self, action: "gotoNext:")
        self.navigationItem.rightBarButtonItems = [moonBarButton!, settingBarButton!]
    }
    
    func gotoNext(sender: UIButton) {
        self.navigationController?.pushViewController(HJSettingController(), animated: true)
    }
    func setMoon() {
        
    }
    
    func network() {
        /*
        srand(UInt32(time(nil)))
        //随机数
        let nonestr = "\(rand())"
        */
        
        let par = ["a": "square", "c": "topic", "device": "ios设备", "openudid":"19deb9dde5ccf65fe1623b59a5ebeff55bcbc319", "client":"iphone"]
        httpRequestJSON(.GET, URLString: kBaseURL, parameters: par, encoding: .URL, success: {[unowned self] (object) -> Void in
        
            if let list_array = object["square_list"] {
                
                var array = [HJSquare]()
                for dic in list_array as! [[String: AnyObject]] {
                    array.append(HJSquare(dic: dic))
                }
                self.square = array

            }
            }) { (error) -> Void in
        }
    
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //TODO: UITableViewDataSource
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    
    

}
