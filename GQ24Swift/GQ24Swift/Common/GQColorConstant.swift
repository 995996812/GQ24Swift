//
//  GQColorConstant.swift
//  GQ24Swift
//
//  Created by 王鹏华 on 2016/11/21.
//  Copyright © 2016年 condentast. All rights reserved.
//

import UIKit

let kColorTabBarSelected = UIColorRGB(rgbValue: 0xff6a00)
let kColorTabBarNormal = UIColorRGB(rgbValue: 0xffffff)
let kColorToClear = UIColor.clear

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {

    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func UIColorRGB(rgbValue: UInt) -> UIColor{
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0xFF) / 255.0,
        alpha: 1.0)
}

