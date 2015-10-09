//
//  TestDriveViewController.swift
//  全球平行进口
//
//  Created by 王卓 on 15/10/9.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import UIKit

class TestDriveViewController: UIViewController {

    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var message: UITextView!
     override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Submit(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
