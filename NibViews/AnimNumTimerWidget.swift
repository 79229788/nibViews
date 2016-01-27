//
//  AnimCountingDownWidget.swift
//  IHFeeder
//
//  Created by duyang on 15/7/1.
//  Copyright (c) 2015年 duyang. All rights reserved.
//

import UIKit

class AnimNumTimerWidget: UIView {
    
    //设置数字值（带有SA结尾，凡在异步更新该属性时，需要调用时startAnim）
    var setNumValuesSA: (min: Int, max: Int) = (10, 100) {
        willSet{
            jumpAnim.fromValue = newValue.min
            jumpAnim.toValue = newValue.max
        }
    }
    //设置后缀文字
    var setSuffixText: String = ""
    //设置数字颜色
    var setTextColor: UIColor = UIColor.blackColor() {
        willSet{
            numLabel.textColor = newValue
        }
    }
    //设置多段颜色
    var setTextColors: [(min: Int, max: Int, color: UIColor)] = []
    //设置字体
    var setFont: UIFont = UIFont.systemFontOfSize(20) {
        willSet{
            numLabel.font = newValue
        }
    }
    //设置字体大小是否根据容器自适应
    var setFontSizeAuto: Bool = false {
        willSet{
            if newValue {
                numLabel.font = UIFont.systemFontOfSize(viewHeight * 1.3)
                numLabel.adjustsFontSizeToFitWidth = true
                numLabel.baselineAdjustment = UIBaselineAdjustment.AlignCenters
            }
        }
    }
    //设置字体位置
    var setTextAlignment: NSTextAlignment = NSTextAlignment.Center{
        willSet{
            numLabel.textAlignment = newValue
        }
    }
    //设置动画时间
    var setAnimDurationSA: NSTimeInterval = 3 {
        willSet{
            jumpAnim.duration = newValue
        }
    }
    //启动动画
    func startAnim() {
        numLabel.pop_addAnimation(jumpAnim, forKey: "jumpAnim")
    }
    
    //**********************************************************************//
    //初始化
    private var viewWidth: CGFloat!
    private var viewHeight: CGFloat!
    private var boxView: UIView!
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        viewWidth = frame.size.width
        viewHeight = frame.size.height
        
        boxView = UIView(frame: CGRectMake(0, 0, viewWidth, viewHeight))
        self.addSubview(boxView)
        
        drawNumLabel()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewWidth = frame.size.width
        viewHeight = frame.size.height
        numLabel.frame = CGRectMake(0, 0, viewWidth, viewHeight)
        if setFontSizeAuto { numLabel.font = UIFont.systemFontOfSize(viewHeight * 1.3) }
    }
    //绘制文本视图
    private var numLabel: UILabel!
    private func drawNumLabel(){
        numLabel = UILabel(frame: CGRectMake(0, 0, viewWidth, viewHeight))
        numLabel.text = String(setNumValuesSA.min)
        numLabel.textColor = setTextColor
        numLabel.font = setFont
        numLabel.textAlignment = setTextAlignment
        boxView.addSubview(numLabel)
        
        drawAnim()
    }
    //绘制动画
    private var jumpAnim: POPBasicAnimation!
    private func drawAnim(){
        jumpAnim = POPBasicAnimation()
        jumpAnim.property = jumpAnimProp()
        jumpAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    }
    //监听动画属性值变化
    private func jumpAnimProp() -> POPAnimatableProperty{
        return POPAnimatableProperty.propertyWithName("jumpAnimProp", initializer: { (prop: POPMutableAnimatableProperty!) -> Void in
            prop.writeBlock = {(object: AnyObject!, values: UnsafePointer<CGFloat>) -> Void in
                let numLabelObject = object as! UILabel
                numLabelObject.text = String(Int(values[0])) + self.setSuffixText
                //更新颜色
                if self.setTextColors.count > 1 {
                    for colorInfo in self.setTextColors {
                        if Int(values[0]) >= colorInfo.min && Int(values[0]) <= colorInfo.max{
                            numLabelObject.textColor = colorInfo.color
                        }
                    }
                }
            }
        }) as! POPAnimatableProperty
    }
}