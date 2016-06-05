//
//  ZWProcessViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWProcessViewController.h"
#import "ZWProcessView.h"
@interface ZWProcessViewController ()

/*  */
@property(nonatomic,strong) ZWProcessView *processView;
/* 显示label */
@property(nonatomic,strong) UILabel         *tiplabel;
@end

static float countIndex = 0.0;

@implementation ZWProcessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置标题
    self.title = @"进度条效果";

    //添加子视图
    [self addChild];
    
    //设置布局
    [self layout];
}

-(void)layout
{
   [self.processView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.mas_equalTo(self.view.mas_centerX);
       make.top.mas_equalTo(200);
       make.width.height.mas_equalTo(100);
   }];
    
    [self.tiplabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(400);
        make.width.mas_equalTo(KScreen_Width);
        make.height.mas_equalTo(40);
    }];
}

#pragma mark - 添加子控件
-(void)addChild
{
    ZWProcessView *v  = [[ZWProcessView alloc]initWithFrame:CGRectZero];
    v.backgroundColor =[UIColor lightGrayColor];
    v.processColor    = [UIColor greenColor];
    [self.view addSubview:v];
    self.processView  = v;
    
    //添加显示
    UILabel *tipLabel = [UILabel new];
    tipLabel.text     = @"点击屏幕显示";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tipLabel];
    self.tiplabel     = tipLabel;
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    countIndex += 0.01;
    self.processView.process = countIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
