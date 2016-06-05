//
//  ZWPieViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWPieViewController.h"
#import "ZWPieView.h"
@interface ZWPieViewController ()

@property(nonatomic,strong)ZWPieView *pieView;

/* 显示label */
@property(nonatomic,weak)UILabel *tipLabel;

@end

@implementation ZWPieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置标题
    self.title = @"饼状图";
    
    //添加视图
    [self addChild];
    
    //设置布局
    [self layout];
}

-(void)layout
{
   [_pieView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.left.mas_equalTo(100);
       make.width.height.mas_equalTo(200);
   }];
    
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(400);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view.mas_width);
        make.width.height.mas_equalTo(30);
    }];
}
  
#pragma mark - 添加子视图
-(void)addChild
{
    if (_pieView) {
        [_pieView removeFromSuperview];
    }
    ZWPieView *pieView = [[ZWPieView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:pieView];
    _pieView = pieView;
    
    //显示label
    UILabel *tiplabel = [[UILabel alloc]initWithFrame:CGRectZero];
    tiplabel.textAlignment = NSTextAlignmentCenter;
    tiplabel.text     = @"点击屏幕换色";
    [self.view addSubview:tiplabel];
    self.tipLabel     = tiplabel;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //添加视图
    [self addChild];
    
    //设置布局
    [self layout];
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
