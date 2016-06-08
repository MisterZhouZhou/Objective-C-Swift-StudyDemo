//
//  NSObject+Caculator.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//   简单计算的类目

#import <Foundation/Foundation.h>
#import "ZWCaculatorMaker.h"
@interface NSObject (Caculator)

+(float)makeCaculator:(void(^)(ZWCaculatorMaker *maker))block;

@end
