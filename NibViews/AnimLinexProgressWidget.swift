//
//  AnimLinexProgressWidget.swift
//  IHFeeder
//
//  Created by duyang on 15/6/3.
//  Copyright (c) 2015年 duyang. All rights reserved.
//

import UIKit

class AnimLinexProgressWidget: UIView {
    
    //设置轨道条颜色
    var setTrackColor: UIColor = UIColor.blackColor() {
        willSet{
            trackLayer.strokeColor = newValue.CGColor
        }
    }
    //设置进度条颜色
    var setProgressColor: UIColor = UIColor.redColor() {
        willSet{
            progressLayer.strokeColor = newValue.CGColor
        }
    }
    //设置动画时长
    var setAnimDurationSA: NSTimeInterval = 3
    //设置动画完成值（百分比1：100）
    var setAnimValue: Float = 0.88 {
        willSet{
            progressPath.removeAllPoints()
            progressPath.moveToPoint(CGPointMake(viewHeight / 2, 0))
            progressPath.addLineToPoint(CGPointMake(viewWidth * CGFloat(newValue) - viewHeight / 2, 0))
            progressLayer.path = progressPath.CGPath
        }
    }
    //开启动画
    func startAnim() {
        progressPath.removeAllPoints()
        progressPath.moveToPoint(CGPointMake(viewHeight / 2, 0))
        progressPath.addLineToPoint(CGPointMake(viewWidth - viewHeight / 2, 0))
        progressLayer.path = progressPath.CGPath
        
        progressAnim.duration = setAnimDurationSA
        progressAnim.toValue = setAnimValue
        progressLayer.addAnimation(progressAnim, forKey: nil)
    }
    //移除动画
    func removeAnim() {
        progressLayer.removeAllAnimations()
        
        progressPath.removeAllPoints()
        progressPath.moveToPoint(CGPointMake(0, 0))
        progressPath.addLineToPoint(CGPointMake(viewWidth * CGFloat(setAnimValue), 0))
        progressLayer.path = progressPath.CGPath
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
        boxView.layer.setAffineTransform(CGAffineTransformMakeTranslation(0, viewHeight / 2))
        self.addSubview(boxView)

        drawTrack()
        drawProgress()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewWidth = frame.size.width
        viewHeight = frame.size.height
        trackPath.moveToPoint(CGPointMake(viewHeight / 2, 0))
        trackPath.addLineToPoint(CGPointMake(viewWidth - viewHeight / 2, 0))
        trackLayer.path = trackPath.CGPath
    }
    //绘制轨道条
    private var trackPath: UIBezierPath!
    private var trackLayer: CAShapeLayer!
    private func drawTrack(){
        trackPath = UIBezierPath()
        trackPath.moveToPoint(CGPointMake(viewHeight / 2, 0))
        trackPath.addLineToPoint(CGPointMake(viewWidth - viewHeight / 2, 0))
        
        trackLayer = CAShapeLayer()
        trackLayer.lineWidth = viewHeight
        trackLayer.strokeColor = setTrackColor.CGColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.path = trackPath.CGPath
        
        boxView.layer.addSublayer(trackLayer)
    }
    
    //绘制进度条
    private var haveAnim: Bool = false
    private var progressPath: UIBezierPath!
    private var progressLayer: CAShapeLayer!
    private func drawProgress(){
        progressPath = UIBezierPath()
        progressLayer = CAShapeLayer()
        progressLayer.lineWidth = viewHeight
        progressLayer.strokeColor = setProgressColor.CGColor
        progressLayer.lineCap = kCALineCapRound
        progressLayer.path = progressPath.CGPath
        boxView.layer.addSublayer(progressLayer)
        
        drawProgressAnim()
    }
    
    //绘制进度条动画
    private var progressAnim: CABasicAnimation!
    private func drawProgressAnim(){
        progressAnim = CABasicAnimation(keyPath: "strokeEnd")
        progressAnim.duration = setAnimDurationSA
        progressAnim.fromValue = 0
        progressAnim.toValue = setAnimValue
        progressAnim.removedOnCompletion = false
        progressAnim.fillMode = kCAFillModeForwards
        progressAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    }
}