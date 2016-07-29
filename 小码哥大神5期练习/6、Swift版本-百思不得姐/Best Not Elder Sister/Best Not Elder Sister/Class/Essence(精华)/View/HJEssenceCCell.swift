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
    private let identifier = "HJEssenceTCell"
    //model数据
    private var modelArray: [HJEssenceModel]? {
        didSet (new) {
            self.tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    func setupUI() {
        self.contentView.addSubview(tableView)
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { () -> Void in
            self.getNetworkData()
        })
        tableView.mj_header.beginRefreshing()
        tableView.registerClass(HJEssenceTCell.self, forCellReuseIdentifier: identifier)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
    }
    //获取网络数据
    func getNetworkData() {
        httpRequestJSON(.GET, URLString: kBaseURL, parameters: joke, encoding: .URL, success: {[unowned self] (object) -> Void in
            self.maxtime = object["info"]["maxtime"].stringValue
            if let _ = self.modelArray {
                self.modelArray?.removeAll()
            }
            var temp = [HJEssenceModel]()
            for item in object["list"].array! {
                temp.append(HJEssenceModel(dic: item.dictionaryObject!))
            }
            self.modelArray = temp
            self.tableView.mj_header.endRefreshing()
            }) {[unowned self] (error) -> Void in
                self.tableView.mj_header.endRefreshing()
        }
    }


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private var maxtime: String = ""
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        table.showsVerticalScrollIndicator = true
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 500
        return table
    }()
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
////        self.tableView = 
//    }
}


extension HJEssenceCCell: UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 600
        return tableView.fd_heightForCellWithIdentifier(identifier, cacheByIndexPath: indexPath, configuration: {[unowned self] (cell) -> Void in
            let model = self.modelArray![indexPath.row]
            (cell as! HJEssenceTCell).tModel = model
        })
    }
}


extension HJEssenceCCell: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var retuenCell: HJEssenceTCell
//        if let cell = tableView.dequeueReusableCellWithIdentifier(identifier) {
//            retuenCell = cell as! HJEssenceTCell
//        } else {
//            retuenCell = HJEssenceTCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
//        }
        let model = self.modelArray![indexPath.row]
//        retuenCell.tModel = model
//        return retuenCell
        let cell: HJEssenceTCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! HJEssenceTCell
        cell.tModel = model
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = self.modelArray {
            return array.count
        } else {
            return 0
        }
    }
}