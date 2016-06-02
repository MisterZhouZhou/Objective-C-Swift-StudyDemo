//
//  ZWBaseViewController.swift
//  Swift-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWBaseViewController: UIViewController{

    var leftItemHiden:Bool{
        set {
            self.navigationItem.leftBarButtonItem = nil
        }
        get{
           return self.leftItemHiden
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //禁止滑动返回
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false;
        
        let leftButton = UIButton(type: .Custom)
        leftButton.setImage(UIImage(named: "back"), forState: .Normal)
        leftButton.setImage(UIImage(named: "back"), forState: .Selected)
        leftButton.addTarget(self, action: #selector(backHome), forControlEvents: .TouchUpInside)
        leftButton.frame = CGRectMake(0,0,20,20);
        leftButton.imageView!.contentMode = .Center;
        
        let  leftBar = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBar;
    
        self.view.backgroundColor = UIColor.whiteColor();
    }

    /**
     返回事件
     */
    func backHome() {
        self.navigationController?.popViewControllerAnimated(true)
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
