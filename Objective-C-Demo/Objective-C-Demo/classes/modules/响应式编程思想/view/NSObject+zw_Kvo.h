//
//  NSObject+zw_Kvo.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (zw_Kvo)

- (void)zw_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
