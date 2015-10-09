//
//  CarsOfBrandViewController.swift
//  全球平行进口
//
//  Created by 王卓 on 15/10/7.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import UIKit

class CarsOfBrandViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let carOfBrandTableViewCellReuseIdentifier = "carOfBrandTableViewCellReuseIdentifier"
    
    @IBOutlet weak var carOfBrandTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    // MARK - :TableView DataSource Method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = carOfBrandTableView.dequeueReusableCellWithIdentifier(carOfBrandTableViewCellReuseIdentifier) as! CarOfBrandTableViewCell
        cell.carImage.image = UIImage(named:"test.jpg")
        cell.carPrice.text = "66万"
        cell.carName.text = "奥迪Q7"
        return cell
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
