//
//  ZWProcessView.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWProcessView.h"

@interface ZWProcessView()

/*  显示进度的label */
@property(nonatomic,weak)UILabel * tipLabel;

@end

@implementation ZWProcessView

-(void)setProcess:(float)process
{
    _process = process;
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f%%",process*100];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat radius = rect.size.width * 0.5 - 1;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat endA   = -M_PI_2 + _process * M_PI *2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    
    //设置边框
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.borderWidth = 1;
    layer.fillColor=[UIColor clearColor].CGColor;
    layer.strokeColor= _processColor == nil?[UIColor blackColor].CGColor:_processColor.CGColor;
    layer.path        = path.CGPath;

    [self.layer addSublayer:layer];
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加子视图
        [self addChild];
    }
    
    return self;
}

-(void)addChild
{
   //显示进度的label
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font          = [UIFont systemFontOfSize:14.0];
    [self addSubview:tipLabel];
    self.tipLabel     = tipLabel;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.mas_equalTo(self).offset(2);
        make.height.mas_equalTo(self).multipliedBy(0.3);
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
