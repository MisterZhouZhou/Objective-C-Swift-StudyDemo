//
//  ZWDragStopView.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWDragStopView.h"

static NSInteger margin_top = 64;
@interface ZWDragStopView ()
/* 背景图片 */
@property(nonatomic,weak)UIImageView *dragImageView;
@end

@implementation ZWDragStopView

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
    
    //当前View的宽
    CGFloat selfWidth= CGRectGetWidth(self.frame);
    //当前View的高
    CGFloat selfheight= CGRectGetHeight(self.frame);
    //获取改变后的frame
    CGRect frame     = [self frameWithTouch:touch];
    
    CGFloat x        = frame.origin.x;
    CGFloat y        = frame.origin.y;
    //水平距离
    if(x <= 0){
        x = 0;
    }
    //与右边距离
    if (x >= KScreen_Width -selfWidth){
        x = KScreen_Width - selfWidth;
    }
    //与顶部距离
    if (y <= margin_top){
        y = margin_top;
    }
    //与底部距离
    if (y >= KScreen_Height - selfheight){
        y = KScreen_Height - selfheight;
    }
    
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.frame = CGRectMake(x, y,frame.size.width,frame.size.height);
    }];

}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch   = [touches anyObject];
    //获取改变后的frame
    CGRect frame     = [self frameWithTouch:touch];
    //当前View的宽度
    CGFloat selfWidth = CGRectGetWidth(frame);
    //当前View的高度
    CGFloat selfheight = CGRectGetHeight(frame);
    //当前View的y
    CGFloat selfY = CGRectGetMidY(frame);
    
     __weak typeof (self) weakSelf = self;
    if (frame.origin.x < (KScreen_Width - selfWidth)/2) {
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.frame = CGRectMake(0, selfY,selfWidth,selfheight);
        }];
    }
    else {
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.frame = CGRectMake(KScreen_Width-selfWidth, selfY,selfWidth,selfheight);
        }];
    }
}


#pragma mark - 根据UITouch计算改变后的frame
-(CGRect)frameWithTouch:(UITouch*)touch
{
    //获取上一次的位置
    CGPoint previous = [touch previousLocationInView:self];
    //获取本次视图的位置
    CGPoint current  = [touch locationInView:self];
    //取得当前视图的中心点
    CGRect frame     = self.frame;
    //改变视图的位置
    frame.origin.x   += current.x - previous.x;
    frame.origin.y   += current.y - previous.y;
    return frame;
}

#pragma mark - setter
-(void)setImg:(UIImage *)img
{
    _img = img;
    self.dragImageView.image = img;
}


@end
