//
//  HJEssenceCCell.swift
//  Best Not Elder Sister
//
//  Created by M-coppco on 16/7/28.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJEssenceCCell: UICollectionViewCell {
    private let identifier = "HJEssenceTCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    func setupUI() {
        self.contentView.addSubview(tableView)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
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
        table.bounces = false
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 88
        return table
    }()
}

extension HJEssenceCCell: UITableViewDelegate {
}


extension HJEssenceCCell: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}