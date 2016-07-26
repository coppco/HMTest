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
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigation()
        //http://api.budejie.com/api/api_open.php
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
        //["a":"themes", "c":"topic"]
        let url = "http://api.budejie.com/api/api_open.php"
        let paremeters =  ["a":"square", "c":"topic"]
        
        Alamofire.request(.GET, url, parameters: paremeters).res//        Alamofire.request(.GET, url, parameters: paremeters)
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
