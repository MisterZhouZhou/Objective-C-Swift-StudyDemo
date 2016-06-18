//
//  ZWCarouselFigureViewController.swift
//  Swift-Demo
//
//  Created by rayootech on 16/6/16.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWCarouselFigureViewController: ZWRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "轮播图"
       
        self.dataArray = ["EasyScrollView轮播图":"ZWEasyScrollViewViewController"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
