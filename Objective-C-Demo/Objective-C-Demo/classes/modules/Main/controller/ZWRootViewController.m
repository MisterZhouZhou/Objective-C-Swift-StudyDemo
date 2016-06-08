//
//  ZWRootViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWRootViewController.h"

@interface ZWRootViewController ()

@end

@implementation ZWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置标题
    self.title = @"功能列表";
    
    //隐藏返回键
    [self setLeftItemHiden:YES];
    
    //设置数据
    [self setdata];
}


#pragma mark - data
#pragma mark - 设置数据源
-(void)setdata
{
    self.dataSource = @[
                        @{@"AlertView":@"ZWAlertViewController"},
                        @{@"view Demo":@"ZWViewListViewController"},
                        @{@"Button":@"ZWButtonListViewController"},
                        @{@"链式编程思想":@"ZWChainProgrammingViewController"}
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
