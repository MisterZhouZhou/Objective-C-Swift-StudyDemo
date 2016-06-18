//
//  ZWMainRootViewController.swift
//  Swift-Demo
//
//  Created by rayootech on 16/6/16.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWMainRootViewController: ZWRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "功能列表"
        //隐藏返回箭头
        self.leftItemHiden        = true
        self.dataArray = ["轮播图":"ZWCarouselFigureViewController",
                          "动画":"ZWAnimationViewController"]
        // Do any additional setup after loading the view.
        
//        print(NSStringFromClass(self.classForCoder))
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
