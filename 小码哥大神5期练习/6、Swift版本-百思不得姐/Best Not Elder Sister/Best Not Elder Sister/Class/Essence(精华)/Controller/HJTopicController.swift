//
//  HJTopicController.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/8/10.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import MJRefresh



class HJTopicController: UITableViewController {
    /**cell重用标识*/
    private let identifier = "HJEssenceTCell"
    
    internal var jokeType = "1"
    private var maxtime = ""
    private var modelArray: [JokeModel] = [JokeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }

    func configUI() {
        self.tableView.registerClass(HJEssenceTCell.self, forCellReuseIdentifier: identifier)
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { () -> Void in
            self.getDownData()
        })
        if 0 == self.modelArray.count {
            self.tableView.mj_header.beginRefreshing()
        }
        
        self.tableView.mj_footer = MJRefreshAutoFooter(refreshingBlock: { () -> Void in
            self.getDownData()
        })
    }
    
    //获取网络数据
    func getMoreData() {
        httpRequestJSON(.GET, URLString: jokeUrlForType(type: self.jokeType, timeStamp: self.maxtime), success: {[unowned self] (object) -> Void in
            self.maxtime = object["info"]["np"].stringValue
            if let array = object["list"].array {
                var temp = [JokeModel]()
                for item in array {
                    let model: JokeModel = JokeModel.dictionaryToModel(item.dictionaryObject!) as! JokeModel
                    temp.append(model)
                }
                self.modelArray.appendContentsOf(temp)
            }
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            }) {[unowned self] (error) -> Void in
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
        }
    }
    
    //下拉刷新
    func getDownData() {
        httpRequestJSON(.GET, URLString: jokeUrlForType(type: self.jokeType, timeStamp: "0"), success: {[unowned self] (object) -> Void in
            self.maxtime = object["info"]["np"].stringValue
            if let array = object["list"].array {
                var temp = [JokeModel]()
                for item in array {
                    let model: JokeModel = JokeModel.dictionaryToModel(item.dictionaryObject!) as! JokeModel
                    temp.append(model)
                }
                self.modelArray = temp
            }
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            }) {[unowned self] (error) -> Void in
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
        }
    }
    


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.modelArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let model = self.modelArray[indexPath.row]
        let cell: HJEssenceTCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! HJEssenceTCell
        cell.tModel = model
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let height = tableView.fd_heightForCellWithIdentifier(identifier, cacheByIndexPath: indexPath, configuration: {[unowned self] (cell) -> Void in
            let model = self.modelArray[indexPath.row]
            (cell as! HJEssenceTCell).tModel = model
            })
        return height
    }

}
