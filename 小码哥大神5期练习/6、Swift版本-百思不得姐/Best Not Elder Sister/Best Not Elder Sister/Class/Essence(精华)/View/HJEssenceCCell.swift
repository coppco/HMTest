//
//  HJEssenceCCell.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/7/28.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON
import UITableView_FDTemplateLayoutCell


class HJEssenceCCell: UICollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        self.maxtime = ""
        self.jokeType = 41
        self.modelArray.removeAll()
    }
    
    /**cell重用标识*/
    private let identifier = "HJEssenceTCell"
    /**最大数据*/
    private var maxtime: String = ""
    //model数据
    private var modelArray: [JokeModel] = [JokeModel]() {
        didSet  {
                self.tableView.reloadData()
        }
    }
    
    /**全部, 图片, 视频等*/
    internal var jokeType: Int = 1
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    func setupUI() {
        self.contentView.addSubview(tableView)
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {[unowned self] () -> Void in
            //下拉刷新
            //
            var parameter = [String: AnyObject]()
//            parameter.updateValue("recommend", forKey: "a")
//            parameter.updateValue("user", forKey: "c")
//            parameter.updateValue(self.jokeType, forKey: "type")
            self.getNetworkData(parameter)
        })
        
        tableView.mj_header.beginRefreshing()
        tableView.registerClass(HJEssenceTCell.self, forCellReuseIdentifier: identifier)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {[unowned self] () -> Void in
            //上拉刷新
            var parameter = [String: AnyObject]()
//            parameter.updateValue("list", forKey: "a")
//            parameter.updateValue(self.jokeType, forKey: "type")
//            parameter.updateValue("data", forKey: "c")
//            parameter.updateValue(self.modelArray.count / 20, forKey: "page")
//            parameter.updateValue(self.maxtime, forKey: "maxtime")
            self.getNetworkData(parameter)
        })
    }
    //获取网络数据
    func getNetworkData(param: [String: AnyObject]) {

        httpRequestJSON(.GET, URLString: homeRecommend, parameters: param, success: {[unowned self] (object) -> Void in
            self.maxtime = object["info"]["maxtime"].stringValue
            var temp = [JokeModel]()
            for item in object["list"].array! {
//                temp.append(JokeModel(dic: item.dictionaryObject!))
            }
            self.modelArray.appendContentsOf(temp)
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            }) {[unowned self] (error) -> Void in
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
        }
    }


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        table.showsVerticalScrollIndicator = true
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
}


extension HJEssenceCCell: UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let height = tableView.fd_heightForCellWithIdentifier(identifier, cacheByIndexPath: indexPath, configuration: {[unowned self] (cell) -> Void in
            let model = self.modelArray[indexPath.row]
            (cell as! HJEssenceTCell).tModel = model
        })
        return height
    }
}


extension HJEssenceCCell: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let model = self.modelArray[indexPath.row]
        let cell: HJEssenceTCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! HJEssenceTCell
        cell.tModel = model
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
}