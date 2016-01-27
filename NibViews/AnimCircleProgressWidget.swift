//
//  AnimCircleProgressWidget.swift
//  IHFeeder
//
//  Created by duyang on 15/6/1.
//  Copyright (c) 2015年 duyang. All rights reserved.
//

import UIKit

class AnimCircleProgressWidget: UIView {
    
    //设置轨道条颜色
    var setTrackColor: UIColor = UIColor.blackColor() {
        willSet{
            trackLayer.strokeColor = newValue.CGColor
        }
    }
    //设置进度条颜色
    var setProgressColors: [UIColor] = [UIColor.redColor(), UIColor.blueColor()] {
        willSet{
            if newValue.count > 1 {
                var progressLineColors: [CGColor] = []
                for color in newValue {
                    progressLineColors.append(color.CGColor)
                }
                progressGradientLayer.colors = progressLineColors
                progressGradientDotLayer.colors = progressLineColors
            }else{
                progressGradientLayer.removeFromSuperlayer()
                progressGradientDotLayer.removeFromSuperlayer()
                progressLayer.strokeColor = newValue[0].CGColor
                boxView.layer.addSublayer(progressLayer)
                progressDotLayer.fillColor = newValue[0].CGColor
                boxView.layer.addSublayer(progressDotLayer)
            }
        }
    }
    //设置线条宽度（带有DR结尾，凡在异步更新该属性时，需要调用时setNeedsDisplay）
    var setLineWidthDR: CGFloat = 5
    //设置是否显示进度条末小圆点
    var setShowProgressDotDR: Bool = true
    //设置动画时间（带有SA结尾，凡在异步更新该属性时，需要调用时startAnim）
    var setAnimDurationSA: CFTimeInterval = 2.5
    //设置动画完成值（百分比1：100）
    var setAnimValueSA: Float = 0.8
    //启动动画
    func startAnim() {
        progressAnim.duration = setAnimDurationSA
        progressDotAnim.duration = setAnimDurationSA
        progressAnim.toValue = setAnimValueSA
        progressDotAnim.toValue = (setAnimValueSA * 360 / 1) * PI / 180
        progressLayer.addAnimation(progressAnim, forKey: nil)
        progressDotLayer.addAnimation(progressDotAnim, forKey: nil)
    }
    //移除动画
    func removeAnim() {
        progressLayer.removeAllAnimations()
        progressDotLayer.removeAllAnimations()
    }
    //设置关联项(里面仅放置一些有关联性质的设置，比如想独立设置属性A，又想独立设置属性B，又不想限制调用顺序，且AB内部相互有变量关联，则可以放在里面)
    override func drawRect(rect: CGRect) {
        progressDotLayer.opacity = 1
        progressGradientDotLayer.opacity = 1
        progressDotRadius = setLineWidthDR * 1.5
        if !setShowProgressDotDR {
            progressDotLayer.opacity = 0
            progressGradientDotLayer.opacity = 0
            progressDotRadius = setLineWidthDR * 0.5
        }
        trackPath.removeAllPoints()
        trackPath.addArcWithCenter(CGPointMake(viewWidth / 2, viewHeight / 2), radius: (viewHeight - setLineWidthDR) / 2 - (progressDotRadius - setLineWidthDR / 2), startAngle: 0, endAngle: 2 * CGFloat(PI), clockwise: true)
        trackLayer.lineWidth = setLineWidthDR
        trackLayer.path = trackPath.CGPath
        
        progressPath.removeAllPoints()
        progressPath.addArcWithCenter(CGPointMake(viewWidth / 2, viewHeight / 2), radius: (viewHeight - setLineWidthDR) / 2 - (progressDotRadius - setLineWidthDR / 2), startAngle: -90 * CGFloat(PI) / 180, endAngle: 270 * CGFloat(PI) / 180, clockwise: true)
        progressLayer.lineWidth = setLineWidthDR
        progressLayer.path = progressPath.CGPath
        
        progressDotPath.removeAllPoints()
        progressDotPath.addArcWithCenter(CGPointMake(viewWidth / 2, progressDotRadius), radius: progressDotRadius, startAngle: 0, endAngle: 2 * CGFloat(PI), clockwise: true)
        progressDotLayer.path = progressDotPath.CGPath
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
        
        progressDotRadius = setLineWidthDR * 1.5
        drawTrackView()
        drawProgressView()
        drawProgressDotView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewWidth = frame.size.width
        viewHeight = frame.size.height
        trackPath.addArcWithCenter(CGPointMake(viewWidth / 2, viewHeight / 2), radius: (viewHeight -  setLineWidthDR) / 2 - (progressDotRadius - setLineWidthDR / 2), startAngle: 0, endAngle: 2 * CGFloat(PI), clockwise: true)
        trackLayer.path = trackPath.CGPath
        
        progressDotPath.addArcWithCenter(CGPointMake(viewWidth / 2, progressDotRadius), radius: progressDotRadius, startAngle: 0, endAngle: 2 * CGFloat(PI), clockwise: true)
        progressDotLayer.frame.size = CGSize(width: viewWidth, height: viewHeight)
        progressDotLayer.position = CGPointMake(viewWidth / 2, viewHeight / 2)
        progressDotLayer.path = progressDotPath.CGPath
    }
    //绘制轨道圆
    private var trackPath: UIBezierPath!
    private var trackLayer: CAShapeLayer!
    private func drawTrackView(){
        trackPath = UIBezierPath()
        trackPath.addArcWithCenter(CGPointMake(viewWidth / 2, viewHeight / 2), radius: (viewHeight -  setLineWidthDR) / 2 - (progressDotRadius - setLineWidthDR / 2), startAngle: 0, endAngle: 2 * CGFloat(PI), clockwise: true)
        
        trackLayer = CAShapeLayer()
        trackLayer.strokeColor = setTrackColor.CGColor
        trackLayer.lineWidth = setLineWidthDR
        trackLayer.fillColor = nil
        trackLayer.path = trackPath.CGPath
        boxView.layer.addSublayer(trackLayer)
    }
    //绘制进度圆
    private var progressPath: UIBezierPath!
    private var progressLayer: CAShapeLayer!
    private func drawProgressView(){
        progressPath = UIBezierPath()
        progressPath.addArcWithCenter(CGPointMake(viewWidth / 2, viewHeight / 2), radius: (viewHeight -  setLineWidthDR) / 2 - (progressDotRadius - setLineWidthDR / 2), startAngle: -90 * CGFloat(PI) / 180, endAngle: 270 * CGFloat(PI) / 180, clockwise: true)
        
        progressLayer = CAShapeLayer()
        progressLayer.fillColor = nil
        progressLayer.lineWidth = setLineWidthDR
        progressLayer.lineCap = kCALineCapRound
        progressLayer.path = progressPath.CGPath
        progressLayer.strokeColor = UIColor.blackColor().CGColor
        drawProgressGradientLayer()
        drawProgressAnim()
    }
    //绘制进度圆末尾小圆点
    private var progressDotRadius: CGFloat!
    private var progressDotPath: UIBezierPath!
    private var progressDotLayer: CAShapeLayer!
    private func drawProgressDotView(){
        progressDotPath = UIBezierPath()
        progressDotPath.addArcWithCenter(CGPointMake(viewWidth / 2, progressDotRadius), radius: progressDotRadius, startAngle: 0, endAngle: 2 * CGFloat(PI), clockwise: true)
        
        progressDotLayer = CAShapeLayer()
        progressDotLayer.strokeColor = nil
        progressDotLayer.frame.size = CGSize(width: viewWidth, height: viewHeight)
        progressDotLayer.position = CGPointMake(viewWidth / 2, viewHeight / 2)
        progressDotLayer.path = progressDotPath.CGPath
        progressDotLayer.fillColor = UIColor.blackColor().CGColor
        drawProgressDotGradientLayer()
        drawProgressDotAnim()
    }
    //绘制进度圆渐变背景
    private var progressGradientLayer: CAGradientLayer!
    private func drawProgressGradientLayer(){
        var progressLineColors: [CGColor] = []
        for color in setProgressColors {
            progressLineColors.append(color.CGColor)
        }
        progressGradientLayer = CAGradientLayer()
        progressGradientLayer.frame = self.bounds
        progressGradientLayer.startPoint = CGPointMake(1, 0)
        progressGradientLayer.endPoint = CGPointMake(0, 1)
        progressGradientLayer.colors = progressLineColors
        progressGradientLayer.mask = progressLayer
        boxView.layer.addSublayer(progressGradientLayer)
    }
    //绘制小圆点渐变背景
    private var progressGradientDotLayer: CAGradientLayer!
    private func drawProgressDotGradientLayer(){
        var progressDotLineColors: [CGColor] = []
        for color in setProgressColors {
            progressDotLineColors.append(color.CGColor)
        }
        progressGradientDotLayer = CAGradientLayer()
        progressGradientDotLayer.frame = self.bounds
        progressGradientDotLayer.startPoint = CGPointMake(1, 0)
        progressGradientDotLayer.endPoint = CGPointMake(0, 1)
        progressGradientDotLayer.colors = progressDotLineColors
        progressGradientDotLayer.mask = progressDotLayer
        boxView.layer.addSublayer(progressGradientDotLayer)
    }
    //绘制进度圆动画
    private var progressAnim: CABasicAnimation!
    private func drawProgressAnim(){
        progressAnim = CABasicAnimation(keyPath: "strokeEnd")
        progressAnim.duration = setAnimDurationSA
        progressAnim.fromValue = 0
        progressAnim.toValue = setAnimValueSA
        progressAnim.removedOnCompletion = false
        progressAnim.fillMode = kCAFillModeForwards
        progressAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    }
    //绘制小圆点动画
    private var progressDotAnim: CABasicAnimation!
    private func drawProgressDotAnim(){
        progressDotAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        progressDotAnim.duration = setAnimDurationSA
        progressDotAnim.fromValue = 0
        progressDotAnim.toValue = (setAnimValueSA * 360 / 1) * PI / 180
        progressDotAnim.removedOnCompletion = false
        progressDotAnim.fillMode = kCAFillModeForwards
        progressDotAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    }
    
}