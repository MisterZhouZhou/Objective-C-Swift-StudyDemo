//
//  NSObject+Caculator.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "NSObject+Caculator.h"

@implementation NSObject (Caculator)

+(float)makeCaculator:(void(^)(ZWCaculatorMaker *maker))block
{
    ZWCaculatorMaker  *make = [[ZWCaculatorMaker alloc]init];
    if (block) {
        block(make);
    }
    return make.result;
}

@end
