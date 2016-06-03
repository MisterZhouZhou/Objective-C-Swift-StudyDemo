//
//  HLHAlertView.h
//  自定义弹框
//
//  Created by rayootech on 16/4/25.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZWUserAlertViewDelegate <NSObject>
-(void)zwAlertViewClickAtButtonIndex:(NSInteger)buttonIndex;
@end

@interface ZWUserAlertView : UIView

//初始化方法
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg delegate:(id)delegate sureTitle:( NSString *)sureText otherTitle:(NSString *)otherText;

//显示
-(void)showInView:(UIView *)tagetView;

@end