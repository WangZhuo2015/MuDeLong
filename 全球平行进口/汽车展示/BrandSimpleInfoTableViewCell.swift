//
//  BrandSimpleInfoTableViewCell.swift
//  全球平行进口
//
//  Created by 王卓 on 15/10/6.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import UIKit

class BrandSimpleInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
