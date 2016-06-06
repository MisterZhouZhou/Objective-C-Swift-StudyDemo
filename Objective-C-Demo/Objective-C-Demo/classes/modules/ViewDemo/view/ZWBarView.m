//
//  ZWBarView.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWBarView.h"
#import "UIColor+Extented.h"
@implementation ZWBarView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *arr = @[@25,@25,@50];
    CGFloat x    = 0;
    CGFloat y    = 0;
    CGFloat w    = 0;
    CGFloat h    = 0;
    
    for ( int i = 0 ; i<arr.count; i++) {
        w = rect.size.width / (2 *arr.count -1);
        x = 2 * w * i;
        h = [arr[i] floatValue] / 100.0 *rect.size.height;
        y = rect.size.height - h;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[UIColor colorRandom]set];
        [path fill];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
