//
//  HJGuideController.swift
//  Best Not Elder Sister
//
//  Created by coco on 16/7/22.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HJGuideController: UICollectionViewController {

    /**点击跳过或者进入的闭包*/
    var skipClosure:(() ->Void)?
    
    private var images: [String] = [String]()
    private let number: Int = 4
    private let layout: UICollectionViewFlowLayout!
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        button.frame = CGRectMake(kHJMainScreenWidth - 50 - 20, 20, 60, 30)
        button.setTitle("跳过", forState: .Normal)
        button.backgroundColor = UIColor.brownColor().colorWithAlphaComponent(0.5)
        //按钮的遮罩
        let bezierPath = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: [.TopRight, .BottomRight], cornerRadii: CGSizeMake(15, 15))
        let mask = CAShapeLayer();
        mask.frame = button.bounds
        mask.path = bezierPath.CGPath
        button.layer.mask = mask
        return button
    }()
    
    private lazy var enterButton:UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        button.setTitle("进入逗比的世界", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        button.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.7)
        button.layer.cornerRadius = 15
        button.hidden = true
        return button
    }()
    
    
    private lazy var pageControl: UIPageControl = {
        let page = UIPageControl(frame: CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height - 40,100,30))
        return page
    }()
    
    /**默认初始化方法*/
     init() {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.itemSize = kHJMainScreenBounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsZero
        for i in 1...number {
            if __isIphone4 {
                images.append(String(format: "320*480-%d.jpg", i))
            }else if __isIphone4s {
                images.append(String(format: "640*960-%d.jpg", i))
            }else if __isIphone5 {
                 images.append(String(format: "640*1136-%d.jpg", i))
            }else if __isIphone6 {
                 images.append(String(format: "750*1334-%d.jpg", i))
            }else if __isIphone6p {
                 images.append(String(format: "1242*2208-%d.jpg", i))
            } else {
                images.append(String(format: "1242*2208-%d.jpg", i))
            }
        }
        super.init(collectionViewLayout: layout)
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    /**使用存放图片名称的数组初始化*/
    init(imageArray:[String]) {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.itemSize = kHJMainScreenBounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsZero
        images = imageArray
        super.init(collectionViewLayout: layout)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.collectionView?.pagingEnabled = true
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.bounces = false
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        skipButton.addTarget(self, action: "skipHasClicked", forControlEvents: .TouchUpInside)
        self.view.addSubview(skipButton)
        
        self.view.addSubview(pageControl)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        // Do any additional setup after loading the view.
        
        enterButton.addTarget(self, action: "skipHasClicked", forControlEvents: .TouchUpInside)
        enterButton.frame = CGRectMake(0, pageControl.frame.origin.y - 30 - 20, kHJMainScreenWidth, 30)
    }

    func skipHasClicked() {
        //设置windows的rootController
        if nil != self.skipClosure {
            self.skipClosure!()
        }
        UIApplication.sharedApplication().keyWindow?.rootViewController = ViewController()
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: isFirst)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.whiteColor()
    
        if nil == cell.backgroundView {
            let imageView = UIImageView(frame: kHJMainScreenBounds)
            imageView.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(images[indexPath.item], ofType: nil)!)
            cell.backgroundView = imageView
        } else {
            let imageView = cell.backgroundView as! UIImageView
            imageView.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(images[indexPath.item], ofType: nil)!)
        }
        
        if indexPath.item == images.count - 1{
            cell.contentView.addSubview(enterButton)
            enterButton.hidden = false
        } else if indexPath.item < images.count  - 2{
            enterButton.hidden = true
        }
        
        return cell
    }

    //MARK:UIScrollViewDelegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = (self.collectionView?.contentOffset.x)! / kHJMainScreenWidth
        pageControl.currentPage = Int(page)
    }

}
