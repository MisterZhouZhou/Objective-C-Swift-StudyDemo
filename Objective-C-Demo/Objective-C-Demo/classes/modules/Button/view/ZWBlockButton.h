//
//  ZWBlockButton.h
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)();

@interface ZWBlockButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame WithBlock:(ActionBlock)block;

@end
