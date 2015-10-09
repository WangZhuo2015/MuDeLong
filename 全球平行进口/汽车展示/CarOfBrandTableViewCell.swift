//
//  CarOfBrandTableViewCell.swift
//  全球平行进口
//
//  Created by 王卓 on 15/10/8.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import UIKit

class CarOfBrandTableViewCell: UITableViewCell {

    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
