//
//  ZWDragView.m
//  View的拖拽效果
//
//  Created by rayootech on 15/9/19.
//  Copyright (c) 2015年 rayootech. All rights reserved.
//

#import "ZWDragView.h"

const NSInteger margin_top = 64;

@interface ZWDragView ()

/* 背景图片 */
@property(nonatomic,weak)UIImageView *dragImageView;


@end

@implementation ZWDragView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加图片
        [self addChild];
    }
    return self;
}

#pragma mark - 添加子控件
-(void)addChild
{
    //背景图片
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:img];
    self.dragImageView = img;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.dragImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(self);
    }];
}

//拖动事件
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch   = [touches anyObject];
    
    //获取上一次的位置
    CGPoint previous = [touch previousLocationInView:self];
    
    //获取本次视图的位置
    CGPoint current  = [touch locationInView:self];
    
    //取得当前视图的中心点
    CGRect frame     = self.frame;
    
    //改变视图的位置
    frame.origin.x   += current.x - previous.x;
    frame.origin.y   += current.y - previous.y;
    
    CGFloat x        = frame.origin.x;
    
    CGFloat y        = frame.origin.y;
    //水平距离
    if(CGRectGetMidX(frame)<= 0){
        x = 0;
    }
    //与右边距离
    if (CGRectGetMaxX(frame) >= KScreen_Width){
        x = KScreen_Width - frame.size.width;
    }
    //与顶部距离
    if (CGRectGetMinY(frame) <= margin_top){
        y = margin_top;
    }
    //与底部距离
    if (CGRectGetMaxY(frame) >= KScreen_Height){
        y = KScreen_Height - frame.size.height;
    }
    
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.05 animations:^{
        
        weakSelf.frame = CGRectMake(x, y,frame.size.width,frame.size.height);
    }];
}


#pragma mark - setter
-(void)setImg:(UIImage *)img
{
    _img = img;
    self.dragImageView.image = img;
}


@end
