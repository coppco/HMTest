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
        self.modelArray.removeAll()
    }
    
    /**cell重用标识*/
    private let identifier = "HJEssenceTCell"
    /**最大数据*/
    private var maxtime: String = "0"
    //model数据
    private var modelArray: [JokeModel] = [JokeModel]() {
        didSet  {
                self.tableView.reloadData()
        }
    }
    
    /**全部, 图片, 视频等*/
    internal var jokeType: String = "1" {
        didSet {
//            if oldValue != jokeType {
                self.setupUI()
//            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }

    func setupUI() {
        self.contentView.addSubview(tableView)
        tableView.registerClass(HJEssenceTCell.self, forCellReuseIdentifier: identifier)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        table.showsVerticalScrollIndicator = true
        table.separatorStyle = .None
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