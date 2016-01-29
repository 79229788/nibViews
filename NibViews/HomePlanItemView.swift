//
//  HomePlanItemView.swift
//  NibViews
//
//  Created by duyang on 16/1/27.
//  Copyright © 2016年 duyang. All rights reserved.
//
//  视图尺寸：宽度:屏宽， 高度:235
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
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var detailUnitLabel: UILabel!
    var currentProgressNumber: Float = 0
    var allProgressNumber: Float = 888
    @IBOutlet weak var currentProgressLabel: UILabel!
    @IBOutlet weak var allProgressLabel: UILabel!
    @IBOutlet private weak var leftBtn: UIButton!
    @IBOutlet private weak var rightBtn: UIButton!
    
    @IBOutlet private weak var separatorTitle: UIView!
    @IBOutlet private weak var separatorBtntop: UIView!
    @IBOutlet private weak var separatorBtnBottom: UIView!
    @IBOutlet private weak var separatorBtncenter: UIView!
    
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
        separatorTitle.transform = CGAffineTransformMakeScale(1, 0.5)
        separatorBtntop.transform = CGAffineTransformMakeScale(1, 0.5)
        separatorBtnBottom.transform = CGAffineTransformMakeScale(1, 0.5)
        separatorBtnBottom.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, 0.5), 1, 0.5)
        separatorBtncenter.transform = CGAffineTransformMakeScale(0.5, 1)
        
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
