//
//  HomeLinkerView.swift
//  NibViews
//
//  Created by duyang on 16/1/26.
//  Copyright © 2016年 duyang. All rights reserved.
//
//  视图尺寸：宽度:屏宽， 高度:按比例，比例为320 : 100
//

import UIKit

protocol HomeLinkerViewDelegate: NSObjectProtocol {
    //当点击了按钮时
    func homeLinkerViewDidTapItem(type: HomeLinkerView.LinkerType)
}
extension HomeLinkerView {
    enum LinkerType: Int{
        case Stats = 1      //饮奶统计
        case Grown = 2      //发育评估
        case Recipes = 3    //食谱大全
        case Alarm = 4      //提醒设置
    }
}

class HomeLinkerView: UIView {
    
    weak var delegate: HomeLinkerViewDelegate!
    
    @IBOutlet weak var linkerView1: UIView!
    @IBOutlet weak var linkerView2: UIView!
    @IBOutlet weak var linkerView3: UIView!
    @IBOutlet weak var linkerView4: UIView!
    
    @IBOutlet weak var roundBtn1: UIView!
    @IBOutlet weak var roundBtn2: UIView!
    @IBOutlet weak var roundBtn3: UIView!
    @IBOutlet weak var roundBtn4: UIView!
    @IBOutlet weak var separatorBottom: UIView!
    
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
        separatorBottom.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, 0.5), 1, 0.5)
        //设置btns为圆形
        roundBtn1.layer.cornerRadius = roundBtn1.frame.size.width / 2
        roundBtn2.layer.cornerRadius = roundBtn1.layer.cornerRadius
        roundBtn3.layer.cornerRadius = roundBtn1.layer.cornerRadius
        roundBtn4.layer.cornerRadius = roundBtn1.layer.cornerRadius
    }
    /**
     初始化
     */
    override func awakeFromNib() {
        //添加点击手势
        linkerView1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "toTapLinker1:"))
        linkerView2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "toTapLinker2:"))
        linkerView3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "toTapLinker3:"))
        linkerView4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "toTapLinker4:"))
    }
    func toTapLinker1(sender: UIGestureRecognizer) {
        delegate?.homeLinkerViewDidTapItem(LinkerType(rawValue: 1)!)
    }
    func toTapLinker2(sender: UIGestureRecognizer) {
        delegate?.homeLinkerViewDidTapItem(LinkerType(rawValue: 2)!)
    }
    func toTapLinker3(sender: UIGestureRecognizer) {
        delegate?.homeLinkerViewDidTapItem(LinkerType(rawValue: 3)!)
    }
    func toTapLinker4(sender: UIGestureRecognizer) {
        delegate?.homeLinkerViewDidTapItem(LinkerType(rawValue: 4)!)
    }
    /**
     重载皮肤
     */
    func reloadSkin() {
    
    }
}
