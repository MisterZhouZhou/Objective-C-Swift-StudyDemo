//
//  FalgView.m
//  UIControl实现点赞功能
//
//  Created by rayootech on 16/2/23.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "FlagView.h"

@implementation FlagView

-(instancetype)initWithFrame:(CGRect)frame NoimageName:(NSString *)noimgStr YesimageName:(NSString *)yesimStr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        
        self.yesStateImg=[UIImage imageNamed:yesimStr];
        self.noStateImg=[UIImage imageNamed:noimgStr];
        //添加事件
        [self addTarget:self action:@selector(flagViewClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
    

}


#pragma mark-点击事件
-(void)flagViewClick{
    if (self.clickFlagMode) {
        self.clickFlagMode(self.flag);
    }
}

@end
