//
//  Extension.swift
//  NibViews
//
//  Created by duyang on 16/1/26.
//  Copyright © 2016年 duyang. All rights reserved.
//

import UIKit

/**
 *  ****************************************** UIView拓展
 */
protocol UIViewLoading {}
extension UIView : UIViewLoading {}
extension UIViewLoading where Self : UIView {
    /**
     从xib加载视图
     
     - parameter Frame: 视图frame
     
     - returns: Self(注意,这个方法返回一个实例类型的“自我”,而不是UIView)
     */
    static func loadFromNib(frame Frame: CGRect) -> Self {
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil).instantiateWithOwner(self, options: nil).first as! Self
        nib.frame = Frame
        nib.layoutIfNeeded()
        return nib
    }
    /**
     从xib加载视图
     
     - parameter Frame: 视图frame
     - parameter index: nib中的视图索引
     
     - returns: Self(注意,这个方法返回一个实例类型的“自我”,而不是UIView)
     */
    static func loadFromNib(frame Frame: CGRect, index: Int) -> Self {
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil).instantiateWithOwner(self, options: nil)[index] as! Self
        nib.frame = Frame
        nib.layoutIfNeeded()
        return nib
    }
}