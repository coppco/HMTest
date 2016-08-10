//
//  HJEssenceController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/25.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

class HJEssenceController: HJBaseTableVController {

    private let identifier = "HJEssenceCCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(HJEssenceCCell.self, forCellWithReuseIdentifier: identifier)
    }

    
    override func gotoNextVC() {
        //MARK: 需要完善
        HJLog("需要完善")
    }
    //类型
    private var jokeType1: String = "1" {
        didSet {
        }
    }
    
//    //获取网络数据
//    func getMoreData() {
//        httpRequestJSON(.GET, URLString: jokeUrlForType(type: self.jokeType, timeStamp: self.maxtime), success: {[unowned self] (object) -> Void in
//            self.maxtime = object["info"]["np"].stringValue
//            if let array = object["list"].array {
//                var temp = [JokeModel]()
//                for item in array {
//                    let model: JokeModel = JokeModel.dictionaryToModel(item.dictionaryObject!) as! JokeModel
//                    temp.append(model)
//                }
//                self.modelArray.appendContentsOf(temp)
//            }
//            self.tableView.mj_header.endRefreshing()
//            self.tableView.mj_footer.endRefreshing()
//            }) {[unowned self] (error) -> Void in
//                self.tableView.mj_header.endRefreshing()
//                self.tableView.mj_footer.endRefreshing()
//        }
//    }
//    
//    //下拉刷新
//    func getDownData() {
//        httpRequestJSON(.GET, URLString: jokeUrlForType(type: self.jokeType, timeStamp: "0"), success: {[unowned self] (object) -> Void in
//            self.maxtime = object["info"]["np"].stringValue
//            if let array = object["list"].array {
//                var temp = [JokeModel]()
//                for item in array {
//                    let model: JokeModel = JokeModel.dictionaryToModel(item.dictionaryObject!) as! JokeModel
//                    temp.append(model)
//                }
//                //                self.modelArray = temp
//            }
//            self.tableView.mj_header.endRefreshing()
//            self.tableView.mj_footer.endRefreshing()
//            }) {[unowned self] (error) -> Void in
//                self.tableView.mj_header.endRefreshing()
//                self.tableView.mj_footer.endRefreshing()
//        }
//    }
//    
    override func changeTitle(title title: String, index: Int) {
        self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: index, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //1为全部，41为视频，10为图片，29为段子，31为音频
    private let jokeType: [String] = ["1", "41", "10", "29", "31", "25", "45", "12", "54", "53"]
}

//MARK: UICollectionViewDataSource
extension HJEssenceController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! HJEssenceCCell
        cell.jokeType = self.jokeType[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.topView.titleList.count
    }
}
//MARK: UICollectionViewDelegate
extension HJEssenceController: UICollectionViewDelegate {
    
}
