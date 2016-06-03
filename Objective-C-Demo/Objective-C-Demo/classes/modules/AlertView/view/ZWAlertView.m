//
//  ZWAlertView.m
//  自定义alertView事件
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWAlertView.h"
#import <objc/runtime.h>
static void *alertViewKey = "alertViewKey";
@implementation ZWAlertView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)canTitle otherButtonTitles:(NSArray *)array handler:(void(^)(NSInteger index))block
{
    NSString *otherTitles = nil;
    if(array.count>0){
        otherTitles = [array componentsJoinedByString:@","];
    }
    self  = [super initWithTitle:title message:msg delegate:self cancelButtonTitle:canTitle otherButtonTitles:otherTitles, nil];
    objc_setAssociatedObject(self, alertViewKey, block, OBJC_ASSOCIATION_COPY);//将block 与 alertOne 关联
    return self;
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void(^block)(NSInteger) = objc_getAssociatedObject(alertView, alertViewKey);
    if (block) {
        block(buttonIndex);
    }
    
}

@end
