//
//  Macros.swift
//  NibViews
//
//  Created by duyang on 16/1/27.
//  Copyright © 2016年 duyang. All rights reserved.
//

import UIKit

//设备屏幕尺寸
let kScreen_Width = UIScreen.mainScreen().bounds.size.width
let kScreen_Height = UIScreen.mainScreen().bounds.size.height
let KScreen_Frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height)
let KScreen_CenterX = kScreen_Width / 2
let KScreen_CenterY = kScreen_Height / 2
//应用尺寸(不包括状态栏,通话时状态栏高度不是20，所以需要知道具体尺寸)
let kContent_Width = UIScreen.mainScreen().applicationFrame.size.width
let kContent_Height = UIScreen.mainScreen().applicationFrame.size.height
let kContent_Frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height)
let kContent_CenterX = kScreen_Width / 2
let kContent_CenterY = kScreen_Height / 2
let PI = Float(M_PI)
//设备信息
let kDeviceVersion = (UIDevice.currentDevice().systemVersion as NSString).doubleValue

//color
func HexRGB(rgbValue: Int) -> UIColor{
    return UIColor(red: CGFloat(((rgbValue & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((rgbValue & 0xFF00) >> 8)) / 255.0, blue: CGFloat(((rgbValue & 0xFF))) / 255.0, alpha: 1)
}
func HexRGBA(rgbValue: Int, alpha:CGFloat) -> UIColor{
    return UIColor(red: CGFloat(((rgbValue & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((rgbValue & 0xFF00) >> 8)) / 255.0, blue: CGFloat(((rgbValue & 0xFF))) / 255.0, alpha: alpha)
}