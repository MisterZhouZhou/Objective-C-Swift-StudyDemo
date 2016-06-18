//
//  ZWLoadingView.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/18.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWLoadingView.h"

static NSString *const kAnimationKey = @"rotationAnimation";

@interface ZWLoadingView ()
@property(strong, nonatomic) CABasicAnimation *rotationAnimation;

@end

@implementation ZWLoadingView

#pragma mark - 生命周期及其基类方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

#pragma mark - 公共方法
- (void)start {
    [self.layer addAnimation:self.rotationAnimation forKey:kAnimationKey];
}

- (void)stop {
    [self.layer removeAnimationForKey:kAnimationKey];
}

#pragma mark - 私有方法
- (void)setup {
    self.image = [UIImage imageNamed:@"loading"];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 0.7;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    self.rotationAnimation = rotationAnimation;
    [self.layer addAnimation:rotationAnimation forKey:kAnimationKey];
}

@end
