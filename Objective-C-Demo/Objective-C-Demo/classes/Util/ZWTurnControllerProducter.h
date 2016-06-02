//
//  ZWViewControllerProducter.h
//  根据控制器名称进行跳转
//
//  Created by rayootech on 16/6/1.
//  Copyright © 2016年 rayootech. All rights reserved.
//  根据控制器名和目标控制器所需参数进行跳转

#import <UIKit/UIKit.h>
@interface ZWTurnControllerProducter : NSObject

/**
 *  根据控制器名进行跳转，无需导入跳转的控制器头文件
 *
 *  @param className  需要跳转的控制器名
 *  @param parameters 想目标控制器跳转所需要的参数，不包含基本数据类型
 *
 *  @return 返回目标控制器
 */
- (UIViewController *)getViewControllerWithClassName:(NSString *)className parameter:(NSDictionary *)parameters;



/**
 *  根据控制器名进行跳转，无需导入跳转的控制器头文件
 *
 *  @param className  需要跳转的控制器名
 *  @param parameters 想目标控制器跳转所需要的参数，包含基本数据类型
 *
 *  @return 返回目标控制器
 */
- (UIViewController *)getViewControllerWithClassName:(NSString *)className allParameter:(NSDictionary *)parameters;

@end
