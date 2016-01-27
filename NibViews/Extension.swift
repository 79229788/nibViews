//
//  Extension.swift
//  NibViews
//
//  Created by duyang on 16/1/26.
//  Copyright © 2016年 duyang. All rights reserved.
//

import UIKit

protocol UIViewLoading {}
extension UIView : UIViewLoading {}

extension UIViewLoading where Self : UIView {
    
    // note that this method returns an instance of type `Self`, rather than UIView
    static func loadFromNib(frame Frame: CGRect) -> Self {
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil).instantiateWithOwner(self, options: nil).first as! Self
        nib.frame = Frame
        nib.layoutIfNeeded()
        return nib
    }
    
}
