//
//  ZWBlockButton.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWBlockButton.h"
#import <objc/runtime.h>

static char buttonKey;

@implementation ZWBlockButton

- (instancetype)initWithFrame:(CGRect)frame WithBlock:(ActionBlock)block
{
    self = [super initWithFrame:frame];
    if (self) {
        objc_setAssociatedObject(self, &buttonKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

#pragma mark - action
-(void)buttonClick
{
   ActionBlock block  = (ActionBlock)objc_getAssociatedObject(self, &buttonKey);
    if (block) {
        block();
    }
}

@end
