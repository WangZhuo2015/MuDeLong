//
//  MoreImageViewController.swift
//  全球平行进口
//
//  Created by 王卓 on 15/10/9.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import UIKit

class MoreImageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var carImageArray=[UIImage]()
    
    @IBOutlet weak var moreImageCollectionView: UICollectionView!
    let moreImagecollectionViewCellReuseIdentifier = "moreImagecollectionViewCellReuseIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        moreImageCollectionView.backgroundColor=UIColor.whiteColor()
        
        moreImageCollectionView.delegate=self
        moreImageCollectionView.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Collection view data source
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let moreImagecollectionViewCell = moreImageCollectionView.dequeueReusableCellWithReuseIdentifier(moreImagecollectionViewCellReuseIdentifier,forIndexPath:indexPath ) as! MoreImageCollectionViewCell
        
        moreImagecollectionViewCell.layoutIfNeeded()
        moreImagecollectionViewCell.carImage.image = UIImage(named: "test.jpg")
        moreImagecollectionViewCell.carNameLabel.text = "第\(indexPath.section) -\(indexPath.row)个"
        return moreImagecollectionViewCell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //collectionView的Sections数量
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        if carImageArray.count%2==0{
//            return carImageArray.count/2
//        }
//        else {
//            return (carImageArray.count/2)+1
//        }
        return 10
    }
//    调整collectionViewCell大小
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
        return CGSizeMake(150, 150)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
