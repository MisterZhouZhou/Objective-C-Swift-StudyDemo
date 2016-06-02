//
//  ZWBaseNavViewController.swift
//  Swift-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWBaseNavViewController: UINavigationController {
    
   
    var statusBarHiden:Bool{
        set {
            if self.statusBarHiden != newValue
            {
               self.statusBarHiden = newValue;
               self.setNeedsStatusBarAppearanceUpdate()
            }
        }
        get{
            return self.statusBarHiden
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func  shouldAutorotate() -> Bool {
        return self.visibleViewController!.shouldAutorotate()
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return self.visibleViewController!.preferredInterfaceOrientationForPresentation()
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }

    override func prefersStatusBarHidden() -> Bool {
        return self.statusBarHiden;
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        // 判断当前导航控制器是否是子控制器
        if (self.childViewControllers.count > 0) {
            // 隐藏底部工具条
            viewController.hidesBottomBarWhenPushed = true;
        }
        super.pushViewController(viewController, animated: animated)
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
