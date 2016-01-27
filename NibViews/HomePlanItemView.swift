//
//  HomePlanItemView.swift
//  NibViews
//
//  Created by duyang on 16/1/27.
//  Copyright © 2016年 duyang. All rights reserved.
//
//  视图尺寸：宽度:适配， 高度:235
//

import UIKit

class HomePlanItemView: UIView {
    
    @IBOutlet weak var SeparatorTitle: UIView!
    @IBOutlet weak var SeparatorBtntop: UIView!
    @IBOutlet weak var SeparatorBtnBottom: UIView!
    @IBOutlet weak var SeparatorBtncenter: UIView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var useNum: UILabel!
    @IBOutlet weak var currentProgress: UILabel!
    @IBOutlet weak var allProgress: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    
    @IBOutlet weak var progressView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /**
     更新UI
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        SeparatorTitle.transform = CGAffineTransformMakeScale(1, 0.5)
        SeparatorBtntop.transform = CGAffineTransformMakeScale(1, 0.5)
        SeparatorBtnBottom.transform = CGAffineTransformMakeScale(1, 0.5)
        SeparatorBtnBottom.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, 0.5), 1, 0.5)
        SeparatorBtncenter.transform = CGAffineTransformMakeScale(0.5, 1)
    }
    /**
     初始化
     */
    override func awakeFromNib() {
        //
    }
    
    @IBAction func toTapLeftBtn(sender: UIButton) {
        
    }
    @IBAction func toTapRightBtn(sender: UIButton) {
        
    }
    
    
    
    /**
     重载皮肤
     */
    func reloadSkin() {
        
    }
    
}
