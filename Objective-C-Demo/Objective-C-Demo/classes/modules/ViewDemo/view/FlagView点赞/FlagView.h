//
//  FalgView.h
//  UIControl实现点赞功能
//
//  Created by rayootech on 16/2/23.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "UIControlFlagView.h"

typedef void(^CurrentFlagMode)(UIControlFlagMode flagMode);

@interface FlagView : UIControlFlagView

@property(nonatomic,copy)CurrentFlagMode clickFlagMode;

//初始化frame，选中，取消图片
-(instancetype)initWithFrame:(CGRect)frame NoimageName:(NSString *)noimgStr YesimageName:(NSString *)yesimStr;

@end
