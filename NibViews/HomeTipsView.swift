//
//  HomeTipsView.swift
//  NibViews
//
//  Created by duyang on 16/1/28.
//  Copyright © 2016年 duyang. All rights reserved.
//
//  视图尺寸：宽度:屏宽， 高度:80
//

import UIKit

class HomeTipsView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    var text: String = "这里是贴士文字文字"
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var separatorTitle: UIView!
    @IBOutlet private weak var separatorBottom: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     初始化
     */
    override func awakeFromNib() {
        textLabel.text = text
    }
    
    /**
     更新UI
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorTitle.transform = CGAffineTransformMakeScale(1, 0.5)
        separatorBottom.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, 0.5), 1, 0.5)
    }
    
    @IBAction func toUnfoldTips(sender: UIButton) {
        let realHeight = CommonHandler.getTextRectHeight(text, font: UIFont.systemFontOfSize(15), width: textLabel.frame.size.width)
        self.frame.size.height = 80 - 18 + realHeight
    }
    
    /**
     重载皮肤
     */
    func reloadSkin() {
        
    }
}