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

protocol HomePlanItemViewDelegate: NSObjectProtocol {
    /**
    当点击了底部按钮时
    
    - parameter number: 按钮编号(从1开始)
    */
    func homePlanItemViewDidTapBottomBtn(number: Int)
}

class HomePlanItemView: UIView {
    
    weak var delegate: HomePlanItemViewDelegate!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var useNumLabel: UILabel!
    var currentProgressNumber: Float = 0
    var allProgressNumber: Float = 888
    @IBOutlet weak var currentProgressLabel: UILabel!
    @IBOutlet weak var allProgressLabel: UILabel!
    @IBOutlet private weak var leftBtn: UIButton!
    @IBOutlet private weak var rightBtn: UIButton!
    
    @IBOutlet private weak var SeparatorTitle: UIView!
    @IBOutlet private weak var SeparatorBtntop: UIView!
    @IBOutlet private weak var SeparatorBtnBottom: UIView!
    @IBOutlet private weak var SeparatorBtncenter: UIView!
    
    var progressWidget: AnimLinexProgressWidget!
    @IBOutlet private weak var progressView: UIView!
    
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
        //添加进度条组件
        progressView.backgroundColor = UIColor.clearColor()
        progressWidget = AnimLinexProgressWidget(frame: CGRectMake(0, 0, progressView.frame.size.width, progressView.frame.size.height))
        progressWidget.setAnimDurationSA = 1.5
        progressWidget.setAnimValue = currentProgressNumber / allProgressNumber
        progressView.addSubview(progressWidget)
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
        
        progressWidget.frame = CGRectMake(0, 0, progressView.frame.size.width, progressView.frame.size.height)
    }
    @IBAction func toTapLeftBtn(sender: UIButton) {
        delegate?.homePlanItemViewDidTapBottomBtn(1)
    }
    @IBAction func toTapRightBtn(sender: UIButton) {
        delegate?.homePlanItemViewDidTapBottomBtn(2)
    }
    
    
    
    /**
     重载皮肤
     */
    func reloadSkin() {
        
    }
    
}
