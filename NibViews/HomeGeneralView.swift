//
//  HomeGeneralView.swift
//  test
//
//  Created by duyang on 16/1/26.
//  Copyright © 2016年 duyang. All rights reserved.
//
//  视图尺寸：宽度:屏宽， 高度:按比例，比例为320 : 260
//

import UIKit

protocol HomeGeneralViewDelegate: NSObjectProtocol {
    /**
     当点击了圆圈视图后
     */
    func homeGeneralViewDidTapRoundView()
    
}

class HomeGeneralView: UIView {
    
    weak var delegate: HomeGeneralViewDelegate!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var separator1: UIView!
    @IBOutlet private weak var separator2: UIView!
    
    var progressWidget: AnimCircleProgressWidget!
    var numTimerWidget: AnimNumTimerWidget!
    @IBOutlet private weak var roundView: UIView!
    @IBOutlet private weak var numberView: UIView!
    
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
        //添加点击手势
        roundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "toTapRoundView:"))
        
        //添加进度条组件
        roundView.backgroundColor = UIColor.clearColor()
        progressWidget = AnimCircleProgressWidget(frame: CGRectMake(0, 0, roundView.frame.size.width, roundView.frame.size.height))
        progressWidget.setAnimDurationSA = 2.5
        progressWidget.setLineWidthDR = 1.5
        progressWidget.setProgressColors = [HexRGB(0xffffff)]
        progressWidget.setTrackColor = HexRGBA(0x000000, alpha: 0.05)
        progressWidget.startAnim()
        roundView.addSubview(progressWidget)
        
        //添加滚动数字组件
        numberView.backgroundColor = UIColor.clearColor()
        numTimerWidget = AnimNumTimerWidget(frame: CGRectMake(0, 0, numberView.frame.size.width, numberView.frame.size.height))
        
        numTimerWidget.setFontSizeAuto = true
        numTimerWidget.setNumValuesSA = (0, 98)
        numTimerWidget.setTextColor = HexRGB(0xffffff)
        numTimerWidget.setAnimDurationSA = progressWidget.setAnimDurationSA
        numTimerWidget.startAnim()
        numberView.addSubview(numTimerWidget)
        
    }
    /**
     更新UI
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        separator1.transform = CGAffineTransformMakeScale(0.5, 1)
        separator2.transform = CGAffineTransformMakeScale(0.5, 1)
        
        progressWidget.frame = CGRectMake(0, 0, roundView.frame.size.width, roundView.frame.size.height)
        numTimerWidget.frame = CGRectMake(0, 0, numberView.frame.size.width, numberView.frame.size.height)
    }
    
    func toTapRoundView(sender: UIGestureRecognizer) {
        delegate?.homeGeneralViewDidTapRoundView()
    }
    
    /**
     重载皮肤
     */
    func reloadSkin() {

    }

}
