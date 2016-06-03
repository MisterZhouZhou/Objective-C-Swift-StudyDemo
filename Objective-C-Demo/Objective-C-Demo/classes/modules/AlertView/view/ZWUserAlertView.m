//
//  HLHAlertView.m
//  自定义弹框
//
//  Created by rayootech on 16/4/25.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWUserAlertView.h"

#define blackColors [UIColor colorWithRed:76/255.0f green:76/255.0f blue:76/255.0f alpha:1.0f]
#define LineColor [UIColor colorWithRed:219/255.0f green:219/255.0f blue:223/255.0f alpha:1.0f]

#define blueColors [UIColor colorWithRed:22/255.0f green:126/255.0f blue:251/255.0f alpha:1.0f]

#define KButtonHeight [UIScreen mainScreen].bounds.size.width/320*40
#define KTitleHeight [UIScreen mainScreen].bounds.size.width/320*20

@interface ZWUserAlertView ()


/*弹框容器*/
@property(nonatomic,weak)UIView *alertView;
/**
 *  标题
 */
@property(nonatomic,weak)UILabel *titleLabel;
/**
 *  内容
 */
@property(nonatomic,weak)UILabel *msgLabel;
/**
 *  横线
 */
@property(nonatomic,weak)UIView *lineView;
/**
 *  确定按钮
 */
@property(nonatomic,weak)UIButton *sureBtn;
/**
 *  竖线
 */
@property(nonatomic,weak)UIView *colLineView;
/**
 *  取消按钮
 */
@property(nonatomic,weak)UIButton *cancelBtn;
/**
 *  显示消息
 */
@property(nonatomic,copy)NSString *msg;
/**
  取消按钮文字
 */
@property(nonatomic,copy)NSString *otherText;
/**
 代理
 */
@property(nonatomic,weak)id delegate;
@end

@implementation ZWUserAlertView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg delegate:(nonnull id)delegate sureTitle:(NSString *)sureText otherTitle:(NSString *)otherText
{
    if (self = [super init])
    {
        self.msg = msg;
        self.otherText = otherText;
        self.delegate = delegate;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self initAlertViewWithTitle:title message:msg sureTitle:sureText otherTitle:otherText];
    }
    return self;
}


#pragma mark - 初始化AlertView
-(void)initAlertViewWithTitle:(NSString *)title message:(NSString *)msg sureTitle:(NSString *)sureText otherTitle:(NSString *)otherText{
    
    self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.4];
    //弹框内容
    UIView *buttonView = [[UIView alloc]init];
    [buttonView setBackgroundColor:[UIColor whiteColor]];
    buttonView.layer.cornerRadius=8;
    buttonView.clipsToBounds=YES;
    self.alertView=buttonView;
    [self addSubview:buttonView];
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = title;
    titleLabel.textColor =[UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    [buttonView addSubview:titleLabel];
    
    //显示内容
    UILabel *msgLabel = [[UILabel alloc]init];
    msgLabel.font = [UIFont systemFontOfSize:14.0];
    msgLabel.text = msg;
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.numberOfLines = 0;
    msgLabel.textColor = [UIColor blackColor];
    self.msgLabel = msgLabel;
    [buttonView addSubview:msgLabel];
    //中间分割线
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = LineColor;
    self.lineView = lineView;
    [buttonView addSubview:lineView];
   
    if(otherText){
        //确定按钮
        UIButton *sureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitle:sureText forState:UIControlStateNormal];
        [sureBtn setTitleColor:blueColors forState:UIControlStateNormal];
        sureBtn.titleLabel.textAlignment = UITextAlignmentCenter;
        self.sureBtn = sureBtn;
        [buttonView addSubview:sureBtn];
        //竖线
        UIView *colLineView=[[UIView alloc]init];
        colLineView.backgroundColor = LineColor;
        self.colLineView = colLineView;
        [buttonView addSubview:colLineView];
        //取消按钮
        UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn addTarget:self action:@selector(cancleClick) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitle:otherText forState:UIControlStateNormal];
        [cancelBtn setTitleColor:blueColors forState:UIControlStateNormal];
        cancelBtn.titleLabel.textAlignment = UITextAlignmentCenter;
        self.cancelBtn = cancelBtn;
        [buttonView addSubview:cancelBtn];
       
    }
    else{
        //确定按钮
        UIButton *sureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitle:sureText forState:UIControlStateNormal];
        [sureBtn setTitleColor:blueColors forState:UIControlStateNormal];
        sureBtn.titleLabel.textAlignment = UITextAlignmentCenter;
        self.sureBtn = sureBtn;
        [buttonView addSubview:sureBtn];
    }
   
}

#pragma mark -布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonViewHeight = 0;
     CGFloat width = [UIScreen mainScreen].bounds.size.width-60*2;
     CGFloat height = [self returnHeightWithTextNSString:self.msg];
    //有标题
    if (self.titleLabel.text){
        self.titleLabel.frame = CGRectMake(10, 10, width-20, KTitleHeight);
        buttonViewHeight += KTitleHeight+5;
    }
    else{
        //无标题
        self.titleLabel.frame = CGRectMake(10, 5, width-20, 10);
        buttonViewHeight += 10;
    }
    self.msgLabel.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame)+10, width-20, height+[UIFont systemFontOfSize:14.0].lineHeight);
    self.lineView.frame=CGRectMake(0, CGRectGetMaxY(self.msgLabel.frame)+20, width, 1);
    buttonViewHeight += height+10;
    //有取消
    if (self.otherText) {
        self.sureBtn.frame=CGRectMake(0, CGRectGetMaxY(self.lineView.frame), width*0.5, KButtonHeight);
        self.colLineView.frame = CGRectMake(width*0.5-0.5, CGRectGetMaxY(self.lineView.frame)+1,1, KButtonHeight);
        self.cancelBtn.frame=CGRectMake(width*0.5, CGRectGetMaxY(self.lineView.frame), width*0.5, KButtonHeight);
    }else{
        self.sureBtn.frame=CGRectMake(0, CGRectGetMaxY(self.lineView.frame), width, KButtonHeight);
    }
    buttonViewHeight += KButtonHeight;
    buttonViewHeight += 10*4;
    self.alertView.frame = CGRectMake(0, 0, width, buttonViewHeight);
    self.alertView.center = self.center;
}

#pragma mark - 显示视图
-(void)showInView:(UIView *)tagetView
{
    [tagetView addSubview:self];
}

#pragma mark - 计算高度
- (CGFloat)returnHeightWithTextNSString:(NSString *)string
{
    CGRect rect=[UIScreen mainScreen].bounds;
    CGRect sizerect=[string boundingRectWithSize:CGSizeMake(rect.size.width-20, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil];
    return sizerect.size.height;
    
}

#pragma mark - 确定按钮
-(void)sureClick
{
    [self removeFromSuperview];
    if (self.delegate)
    {
        [self.delegate zwAlertViewClickAtButtonIndex:0];
    }
}

#pragma mark -移除视图
-(void)cancleClick
{
    [self removeFromSuperview];
    if (self.delegate)
    {
        [self.delegate zwAlertViewClickAtButtonIndex:1];
    }
}

@end
