//
//  ZWGroupIcon.m
//  分组头像
//
//  Created by rayootech on 16/6/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWGroupIcon.h"

#define rowNumber 2

@interface ZWGroupIcon ()

/* 图片数组 */
@property(nonatomic,strong) NSArray *imageArray;
@end
@implementation ZWGroupIcon

#pragma mark - init
-(instancetype)initWithFrame:(CGRect)frame andImageArray:(NSArray *)imgArray
{
    if (self = [super initWithFrame: frame]) {
        
        //对本身进行裁剪
        self.layer.cornerRadius  = CGRectGetWidth(self.bounds)*0.5;
        self.layer.masksToBounds = YES;
        
        //添加子控件
        self.imageArray = imgArray;
        [self addChild];
    }
    return self;
}

#pragma mark - action
#pragma mark - 添加子视图
-(void)addChild
{
    for (int i = 0; i <self.imageArray.count; i++) {
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.image        = [UIImage imageNamed:self.imageArray[i]];
        [self addSubview:imgV];
    }
}


#pragma mark - layout 
-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置布局
    NSInteger count = self.subviews.count;
    CGFloat imgWH   = CGRectGetWidth(self.bounds) / rowNumber;
    for (int i = 0; i < count ; i++) {
        NSInteger row   = i / rowNumber;
        NSInteger col   = i % rowNumber;
        UIImageView *imgV = (UIImageView *)self.subviews[i];
        imgV.frame = CGRectMake(col*imgWH, row*imgWH, imgWH, imgWH);
    }
}
@end
