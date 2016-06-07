//
//  ZWViewControl.m
//  UIControl实现点赞功能
//
//  Created by rayootech on 16/2/23.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWViewControl.h"

@interface ZWViewControl ()

@end

@implementation ZWViewControl

-(void)awakeFromNib
{
    
    //添加事件
    [self addTarget:self action:@selector(flagViewClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark-点击事件
-(void)flagViewClick{

    switch (self.flag) {
        case FlagModelNO:
            [self setFlag:FlagModelYES withAnimation:YES];
            break;
        case FlagModelYES:
            [self setFlag:FlagModelNO withAnimation:NO];
            break;
        default:
            break;
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.yesStateImg=[UIImage imageNamed:@"chakanbaoming"];
    self.noStateImg=[UIImage imageNamed:@"qupingjiahui"];
}

@end
