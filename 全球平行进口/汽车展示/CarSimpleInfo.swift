//
//  CarSimpleInfo.swift
//  全球平行进口
//
//  Created by 王卓 on 15/9/30.
//  Copyright © 2015年 538_iOS_Team. All rights reserved.
//

import Foundation
struct CarSimpleInfo{
    var carImageURL:NSURL
    var carName:String
    
    init(Img:String,carName:String) {
        carImageURL = NSURL(fileURLWithPath: Img)
        self.carName = carName
    }
    
}