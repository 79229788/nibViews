//
//  CommonHandler.swift
//  IHFeeder
//
//  Created by duyang on 15/7/29.
//  Copyright (c) 2015年 duyang. All rights reserved.
//

import UIKit

class  CommonHandler {
    
    /**
    设置当前页面的push返回按钮
    
    - parameter target: 指定视图控制器，一般为self
    */
    static func setFixedBackBtn(target: UIViewController){
        let backBtn = UIBarButtonItem()
        backBtn.title = "返回"
        target.navigationItem.backBarButtonItem = backBtn
    }
    /**
     颜色字符串转颜色哈希值
     
     - parameter colorStr: 颜色字符串（6位数）
     
     - returns: 颜色哈希值
     */
    static func stringToHexValue(colorStr: String) -> Int {
        return Int(strtoul(colorStr, nil, 16))
    }
    /**
    获取数组索引
    
    - parameter value: 查询的CGFloat值
    - parameter arr:   CGFloat数组
    
    - returns: 索引
    */
    static func getIndexFromFloatArray(value:CGFloat, arr:[CGFloat]) -> Int! {
        var curarr:[Int] = []
        var res:Int!
        for i in 0..<arr.count{
            if value == arr[i]{
                curarr.append(i)
                res = curarr[0]
                break
            }
        }
        return res
    }
    static func getIndexFromStringArray(value:String, arr:[String]) -> Int! {
        var curarr:[Int] = []
        var res:Int!
        for i in 0..<arr.count{
            if value == arr[i]{
                curarr.append(i)
                res = curarr[0]
                break
            }
        }
        return res
    }
    
    /**
    数组除去重复值
    
    - parameter array: 字符串数组
    
    - returns: 新数组
    */
    static func arrayRemoveDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(value)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }
    static func arrayRemoveDuplicateInts(values: [Int]) -> [Int] {
        // Convert array into a set to get unique values.
        let uniques = Set<Int>(values)
        // Convert set back into an Array of Ints.
        let result = Array<Int>(uniques)
        return result
    }
    
    /**
    获取当前屏幕显示的viewController
    
    - returns: UIViewController
    */
    static func getCurrentViewController() -> UIViewController! {
        var currentVC: UIViewController!
        var keyWindow = UIApplication.sharedApplication().keyWindow!
        if keyWindow.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.sharedApplication().windows
            for window in windows {
                if window.windowLevel == UIWindowLevelNormal {
                    keyWindow = window
                    break
                }
            }
        }
        let frontView = keyWindow.subviews[0]
        let nextResponder = frontView.nextResponder()
        if nextResponder!.isKindOfClass(UIViewController) {
            currentVC = nextResponder as? UIViewController
        }else{
            currentVC = keyWindow.rootViewController
        }
        
        return currentVC
    }

    /**
    生成随机字符串
    
    - parameter len: 字符串长度
    
    - returns: 随机字符串
    */
    static func getRandomString(len:Int) -> String {
        let a = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9"
        var c: [String] = a.componentsSeparatedByString(",")
        var s: [String] = []
        for _ in (1...len) {
            s.append(c[Int(arc4random()) % c.count])
        }
        return s.joinWithSeparator("")
    }
    
    /**
    获取多行文字的高度
    
    - parameter text:  文字内容
    - parameter font:  文字字体
    - parameter width: 文字区域宽度
    
    - returns: 文字区域高度
    */
    static func getTextRectHeight(text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let size: CGSize = text.boundingRectWithSize(CGSizeMake(width, CGFloat(MAXFLOAT)), options: option, attributes: attributes, context: nil).size

        return size.height
    }
    /**
     得到文字的宽度
     
     - parameter text: 文字内容
     - parameter font: 文字字体
     
     - returns: 文字区域宽度
     */
    static func getTextRectWidth(text: String, font: UIFont) -> CGFloat {
        let textSize = NSString(format: text).sizeWithAttributes([NSFontAttributeName: font])
        return textSize.width
    }
}
