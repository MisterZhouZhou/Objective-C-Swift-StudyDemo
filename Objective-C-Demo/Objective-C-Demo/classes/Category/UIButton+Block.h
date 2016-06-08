//
//  UIButton+Block.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^ActionBlock)();

@interface UIButton (Block)

/**
 *  按钮block事件
 *
 *  @param event  触发方式
 *  @param action 处理事件
 */
-(void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)action;

@end
