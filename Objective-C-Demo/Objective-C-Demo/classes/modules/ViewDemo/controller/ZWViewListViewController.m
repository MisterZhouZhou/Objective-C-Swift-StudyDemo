//
//  ZWViewListViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/4.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWViewListViewController.h"

@interface ZWViewListViewController ()

@end

@implementation ZWViewListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"view 相关功能列表";
    
    //设置数据
    [self setdata];
}

#pragma mark - data
#pragma mark - 设置数据源
-(void)setdata
{
    self.dataSource = @[
                        @{@"拖拽View":@"ZWViewDragViewController"},
                        @{@"View的停靠":@"ZWVIewStopViewController"},
                        @{@"抽屉效果":@"ZWDrawerViewController"},
                        @{@"进度条效果":@"ZWProcessViewController"},
                        @{@"画饼图":@"ZWPieViewController"}
                        ];
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
