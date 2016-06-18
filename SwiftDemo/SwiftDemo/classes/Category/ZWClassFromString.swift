//
//  ZWClassFromString.swift
//  Swift-Demo
//
//  Created by rayootech on 16/6/17.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
   func swiftClassFromString(className: String) -> UIViewController! {
        // get the project name
        if  let appName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
            //拼接控制器名
            let classStringName = "\(appName).\(className)"
            //将控制名转换为类
            let classType = NSClassFromString(classStringName) as? UIViewController.Type
            if let type = classType {
                let newVC = type.init()
                return newVC
            }
        }
        return nil;
    }
}




