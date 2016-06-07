//
//  ZWUIControl.h
//  UIControl实现点赞功能
//
//  Created by rayootech on 16/2/23.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, UIControlFlagMode) {
    FlagModelNO,
    FlagModelYES,
    FlagModelDefalt
};
@interface ZWUIControl : UIControl

@property (nonatomic, strong) UIImage*noStateImg;
@property (nonatomic, strong) UIImage*yesStateImg;
@property (nonatomic, strong) UIImage*defaultStateImg;

@property (nonatomic, assign) UIControlFlagMode flag;

- (void)setFlag:(UIControlFlagMode)flag withAnimation:(BOOL)animation;

@end

