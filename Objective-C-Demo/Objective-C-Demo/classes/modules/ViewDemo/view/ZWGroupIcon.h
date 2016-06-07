//
//  ZWGroupIcon.h
//  分组头像
//
//  Created by rayootech on 16/6/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWGroupIcon : UIView

/**
 *  初始化方法
 *
 *  @param frame    icon的frame
 *  @param imgArray 需要显示的图片数组,每行显示两个，多余四个默认显示前4个
 *
 *  @return ZWGroupIcon
 */
-(instancetype)initWithFrame:(CGRect)frame andImageArray:(NSArray *)imgArray;

@end
