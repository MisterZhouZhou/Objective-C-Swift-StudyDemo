//
//  ViewController.h
//  11-抽屉效果
//
//  Created by xiaomage on 15/6/16.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ZWBaseViewController.h"

@interface ZWDrawerViewController : ZWBaseViewController

// 设计原理：如果需要把控件暴露出去，一定要要写readonly
@property (nonatomic, weak, readonly) UIView *mainV;
@property (nonatomic, weak, readonly) UIView *leftV;
@property (nonatomic, weak, readonly) UIView *rightV;

@end

