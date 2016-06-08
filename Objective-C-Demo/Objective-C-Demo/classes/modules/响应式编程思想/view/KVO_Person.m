//
//  KVO_Person.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "KVO_Person.h"
#import "NSObject+zw_Kvo.h"
#import <objc/runtime.h>
@implementation KVO_Person

-(void)setAge:(NSInteger)age
{
    [super setAge:age];
    
     //发通知
    id obsver = objc_getAssociatedObject(self, @"obsever");
    id keypath = objc_getAssociatedObject(self, @"keyPath");
    [obsver observeValueForKeyPath:keypath ofObject:nil change:nil context:nil];
}

@end
