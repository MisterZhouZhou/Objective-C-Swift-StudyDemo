//
//  NSObject+ZWTurnPush.h
//  根据控制器名称进行跳转
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//  根据控制器名和参数进行跳转

#import <UIKit/UIKit.h>

@interface UINavigationController (ZWTurnPush)

/**
 *  根据控制器名和参数进行跳转(包含基本数据类型)
 *
 *  @param vcName  目标控制器名称
 *  @param dic     参数
 *  @param animate 动画
 */
- (void)pushWithViewControllerName:(NSString *)vcName
                           paramas:(NSDictionary *)dic
                          animated:(BOOL)animate;

@end
