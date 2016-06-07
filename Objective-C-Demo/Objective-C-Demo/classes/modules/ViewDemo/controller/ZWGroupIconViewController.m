//
//  ZWGroupIconViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWGroupIconViewController.h"
#import "ZWGroupIcon.h"
@interface ZWGroupIconViewController ()

@end

@implementation ZWGroupIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题
    self.title = @"分组头像显示";
    
    NSArray *array = @[@"0",@"1",@"2",@"3"];
    ZWGroupIcon *v = [[ZWGroupIcon alloc]initWithFrame:CGRectMake(100, 100, 50, 50) andImageArray:array];
    [self.view addSubview:v];
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
