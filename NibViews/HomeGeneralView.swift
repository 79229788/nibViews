//
//  HomeGeneralView.swift
//  test
//
//  Created by duyang on 16/1/26.
//  Copyright © 2016年 duyang. All rights reserved.
//
//  视图尺寸比例为 320 : 260
//

import UIKit

class HomeGeneralView: UIView {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var separator1: UIView!
    @IBOutlet weak var separator2: UIView!
    
    var round: UIView!
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
        separator1.transform = CGAffineTransformMakeScale(0.5, 1)
        separator2.transform = CGAffineTransformMakeScale(0.5, 1)
    }
    /**
     初始化
     */
    override func awakeFromNib() {
        //
    }
    /**
     重载皮肤
     */
    func reloadSkin() {

    }

}
