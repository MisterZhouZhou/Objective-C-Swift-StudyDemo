
//
//  ZWPushViewController.swift
//  SwiftDemo
//
//  Created by rayootech on 16/6/18.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
    func  pushViewControllerWithName(className: String) {
        //将控制器名转换为类
        let vc = self.swiftClassFromString(className)
        self.pushViewController(vc, animated: true)
    }
}