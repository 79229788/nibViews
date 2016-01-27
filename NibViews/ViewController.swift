//
//  ViewController.swift
//  NibViews
//
//  Created by duyang on 16/1/26.
//  Copyright © 2016年 duyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = HexRGB(0xf5f5f5)
        let myView = HomePlanItemView.loadFromNib(frame: CGRectMake(0, 100, self.view.frame.size.width, 235))
        self.view.addSubview(myView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

