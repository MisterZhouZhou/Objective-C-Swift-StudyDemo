//
//  NSObject+zw_Kvo.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "NSObject+zw_Kvo.h"
#import "KVO_Person.h"
#import <objc/runtime.h>
@implementation NSObject (zw_Kvo)

- (void)zw_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
     //修改对象指针
    object_setClass(self, [KVO_Person class]);
    
    //保存可以
    objc_setAssociatedObject(self, @"obsever", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
     objc_setAssociatedObject(self, @"keyPath", keyPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
