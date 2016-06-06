//
//  ZWPieView.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWPieView.h"

@implementation ZWPieView

-(NSArray*)arrRandom
{
    int totoal = 100;
    
    NSMutableArray *msArray = [NSMutableArray array];
    
    int temp   = 0;
    for (int i=0; i< arc4random_uniform(10)+1; i++) {
        temp   = arc4random_uniform(totoal)+1;
        [msArray addObject:@(temp)];
        if (temp == totoal) {
            break;
        }
        totoal -= temp;
    }
    if (totoal) {
        [msArray addObject:@(totoal)];
    }
    return msArray;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSArray *arr    = [self arrRandom];
    CGFloat radius  = rect.size.width * 0.5;
    CGPoint center  = CGPointMake(radius, radius);
    
    CGFloat startA  = 0;
    CGFloat angle   = 0;
    CGFloat endA    = 0;
    
    for (int i = 0; i< arr.count; i++) {
        startA = endA;
        angle  = [arr[i] doubleValue] / 100 * M_PI * 2;
        endA   = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self colorRandom]set];
        [path fill];
    }
}

-(UIColor *)colorRandom
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
