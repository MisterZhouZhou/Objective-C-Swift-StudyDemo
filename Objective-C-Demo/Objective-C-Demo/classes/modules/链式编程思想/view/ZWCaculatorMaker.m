//
//  ZWCaculatorMaker.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWCaculatorMaker.h"

@implementation ZWCaculatorMaker

#pragma mark - aciton
#pragma mark - add
-(ZWCaculatorMaker* (^)(float num))add
{
  return ^(float num){
    
      _result += num;
      return self;
  };
}

#pragma mark - multy
-(ZWCaculatorMaker* (^)(float num))multy
{
    return ^(float num){
        
        _result *= num;
        return self;
    };
}

@end
