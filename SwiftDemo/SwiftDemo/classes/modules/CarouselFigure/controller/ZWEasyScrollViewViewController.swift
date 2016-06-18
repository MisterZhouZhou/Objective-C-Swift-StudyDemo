//
//  ZWEasyScrollViewViewController.swift
//  SwiftDemo
//
//  Created by rayootech on 16/6/18.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWEasyScrollViewViewController: ZWBaseViewController,EasyScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "轮播图控制器"
        
        // 设置CGRectZero从导航栏下开始计算
        if self.respondsToSelector(Selector("setEdgesForExtendedLayout")){
            self.edgesForExtendedLayout = .None;
        }
        
        let array = ["beijing","Brisbane","CityofLosAngeles","CityofVancouver"]
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height/3
        let easyView = EasyScrollView(frame: CGRectMake(0,64,width,height))
        easyView.delegate = self
        easyView.initScrollview(array)
        
        self.view.addSubview(easyView)
        
    }
    
    func EasyScrollViewDidClicked(index:Int){
        print("index==\(index)");
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
