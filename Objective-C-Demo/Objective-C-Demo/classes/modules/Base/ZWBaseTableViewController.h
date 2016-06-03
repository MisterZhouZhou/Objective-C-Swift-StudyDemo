//
//  ZWBaseTableViewController.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/3.
//  Copyright © 2016年 rayootech. All rights reserved.
//  继承该控制器拥有自定义导航和表控制器

#import "ZWBaseViewController.h"

@interface ZWBaseTableViewController : ZWBaseViewController

/* 数据源 */
@property(nonatomic,strong) NSArray     *dataSource;

@end
