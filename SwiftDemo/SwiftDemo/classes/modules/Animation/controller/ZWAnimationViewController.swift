
//
//  ZWAnimationViewController.swift
//  SwiftDemo
//
//  Created by rayootech on 16/6/18.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWAnimationViewController: ZWRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "动画功能列表"

        self.dataArray = ["画基础图形":"DrawCircleViewController",
                          "CAShapeLayer&UIBezierPath操作":"ShapeAndBezierPathViewController"]
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
