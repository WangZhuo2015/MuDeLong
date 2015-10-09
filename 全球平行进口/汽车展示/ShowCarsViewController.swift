//
//  ShowCarsViewController.swift
//  全球平行进口
//
//  Created by 王卓 on 15/9/30.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import UIKit

class ShowCarsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    let collectionViewCellReuseIdentifier = "carsCollectionViewCellReuseIdentifier"
    let tableViewCellReuseIdentifier = "brandTableViewCellReuseIdentifier"
    
    @IBOutlet weak var carsSegmentedControl: UISegmentedControl!

    @IBOutlet weak var brandTableView: UITableView!
    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var carInfoArray = [CarSimpleInfo]()
    var brandInfoArray = [CarSimpleInfo]()
    var brandSectionArray:[String]{
        get{
            return searchForSection(brandInfoArray)
        }
    }// = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.carsCollectionView.backgroundColor = UIColor.whiteColor()
        //默认选项卡
        carsCollectionView.hidden=false
        brandTableView.hidden = true
        searchBar.placeholder = "搜索..."
        //页面转换方法
        carsSegmentedControl.addTarget(self, action: Selector("hideView:"), forControlEvents: UIControlEvents.ValueChanged)
        //设置刷新
        self.brandTableView.header = MJRefreshNormalHeader(refreshingBlock: tableViewRefreshHeader)
        self.brandTableView.footer = MJRefreshAutoNormalFooter (refreshingBlock: tableViewRefreshFooter)
        self.carsCollectionView.header = MJRefreshNormalHeader(refreshingBlock: collectionViewRefreshHeader)
        self.carsCollectionView.footer = MJRefreshAutoNormalFooter (refreshingBlock: collectionViewRefreshFooter)
        //设置代理、数据源
        brandTableView.dataSource = self
        brandTableView.delegate = self
        carsCollectionView.dataSource = self
        carsCollectionView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
    根据UITableView Data数组寻找索引并添加进索引数组
    
    - parameter DataArray: UITableView数据数组
    
    - returns: 索引数组
    */
    func searchForSection(DataArray:[CarSimpleInfo])->[String]{
        var stringDataArray = [String]()
//=================================================
///奇怪的错误
//        for item in DataArray{
//            print(item)
//            stringDataArray.append(item.carName)
//        }
//=================================================
        for var i=0;i<DataArray.count;++i{
            stringDataArray.append(DataArray[i].carName)
        }
        var array=[String]()
        for str in stringDataArray{
            //查重,避免添加错误的索引
            var flag = false
            for existSection in array{
                if String(str[str.startIndex]) == existSection {
                    flag = true
                }
            }
            if flag == false{
                array.append(String(str[str.startIndex]))
            }
        }
        return array
    }
    
    /**
    根据UISegmentedControl不同的值显示不同的页面
    
    - parameter sender: UISegmentedControl的实例
    */
    func hideView(sender:UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0: brandTableView.hidden = true
        carsCollectionView.hidden = false
        searchBar.placeholder = "搜索..."
            break
        case 1: carsCollectionView.hidden = true
                brandTableView.hidden = false
                searchBar.placeholder = "按车名搜索..."
            break
        default:break
        }
        //收起键盘
        searchBar.resignFirstResponder()
    }
    
    //tableView刷新方法
    func tableViewRefreshHeader(){
        let testBrand = CarSimpleInfo(Img: "", carName: "我好帅")
        brandInfoArray.append(testBrand)
        self.brandTableView.reloadData()
        self.brandTableView.header.endRefreshing()
    }
    func tableViewRefreshFooter(){
        let testBrand = CarSimpleInfo(Img: "", carName: "我好帅")
        brandInfoArray.append(testBrand)
        self.brandTableView.reloadData()
        self.brandTableView.footer.endRefreshing()
    }
    //collectionView刷新方法
    func collectionViewRefreshHeader(){
        let testBrand = CarSimpleInfo(Img: "", carName: "我好帅")
        carInfoArray.append(testBrand)
        carInfoArray.append(testBrand)
        self.carsCollectionView.reloadData()
        self.carsCollectionView.header.endRefreshing()
    }
    func collectionViewRefreshFooter(){
        let testBrand = CarSimpleInfo(Img: "", carName: "我好帅")
        carInfoArray.append(testBrand)
        carInfoArray.append(testBrand)
        self.carsCollectionView.reloadData()
        self.carsCollectionView.footer.endRefreshing()
    }
    
    // MARK: - Table view data source
    //索引数量
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return brandSectionArray.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return brandSectionArray[section]
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return brandSectionArray
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return brandInfoArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = brandTableView.dequeueReusableCellWithIdentifier(tableViewCellReuseIdentifier) as! BrandSimpleInfoTableViewCell
        tableViewCell.brandImage.image = UIImage(named: "test.jpg")
        tableViewCell.brandLabel.text = brandInfoArray[indexPath.row].carName
        return tableViewCell
    }
    

    
    // MARK: - Collection view data source
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionViewCell = carsCollectionView.dequeueReusableCellWithReuseIdentifier(collectionViewCellReuseIdentifier,forIndexPath:indexPath ) as! CarsCollectionViewCell
        collectionViewCell.carImage.image = UIImage(named: "test.jpg")
        collectionViewCell.carLabel.text = "第\(indexPath.section) -\(indexPath.row)个"
        return collectionViewCell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    //collectionView的Sections数量
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if carInfoArray.count%2==0{
            return carInfoArray.count/2
        }
        else {
            return (carInfoArray.count/2)+1
        }
    }
    //调整collectionViewCell大小
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
        return CGSizeMake(150, 150)
    }
}
