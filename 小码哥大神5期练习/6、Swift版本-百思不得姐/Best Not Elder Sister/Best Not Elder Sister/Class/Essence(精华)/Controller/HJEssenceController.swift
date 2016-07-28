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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: UICollectionViewDataSource
extension HJEssenceController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! HJEssenceCCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
//MARK: UICollectionViewDelegate
extension HJEssenceController: UICollectionViewDelegate {
    
}
