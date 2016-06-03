//
//  ZWAlertView.h
//  自定义alertView事件
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWAlertView : UIAlertView

/**
 *  为UIAlertView动态绑定消息
 *
 *  @param title    标题
 *  @param msg      显示信息
 *  @param canTitle cancle按钮title
 *  @param array    取消按钮title
 *  @param block    block
 *
 *  @return         UIAlertView 对象
 */
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)canTitle otherButtonTitles:(NSArray *)array handler:(void(^)(NSInteger index))block;

@end
