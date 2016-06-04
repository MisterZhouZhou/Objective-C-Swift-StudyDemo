//
//  ZWProcessView.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWProcessView : UIView

//进度值
@property(nonatomic,assign)float process;
//进度条颜色
@property(nonatomic,strong)UIColor *processColor;
@end
