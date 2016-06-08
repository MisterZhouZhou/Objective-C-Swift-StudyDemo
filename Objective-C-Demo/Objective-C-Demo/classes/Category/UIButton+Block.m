//
//  UIButton+Block.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "UIButton+Block.h"
static char overViewKey;

@implementation UIButton (Block)

-(void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)action
{
    objc_setAssociatedObject(self, &overViewKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClick) forControlEvents:event];
}

#pragma mark - action 
-(void)buttonClick
{
    ActionBlock block = objc_getAssociatedObject(self, &overViewKey);
    if (block) {
        block();
    }
}

@end
