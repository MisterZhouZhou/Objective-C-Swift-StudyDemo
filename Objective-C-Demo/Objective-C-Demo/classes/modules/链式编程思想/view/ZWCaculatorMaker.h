//
//  ZWCaculatorMaker.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  ADD
#define  MULTY

@interface ZWCaculatorMaker : NSObject

@property(nonatomic,assign)float result;

-(ZWCaculatorMaker* (^)(float num))add;  ADD

-(ZWCaculatorMaker* (^)(float num))multy;  MULTY

@end
