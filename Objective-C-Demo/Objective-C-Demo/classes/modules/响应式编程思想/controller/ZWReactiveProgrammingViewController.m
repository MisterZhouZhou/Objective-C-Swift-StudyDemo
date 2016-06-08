//
//  ZWReactiveProgrammingViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWReactiveProgrammingViewController.h"

@interface ZWReactiveProgrammingViewController ()

@end

@implementation ZWReactiveProgrammingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"响应式编程思想";
    
    //设置数据
    [self setdata];
}

#pragma mark - data
#pragma mark - 设置数据源
-(void)setdata
{
    self.dataSource = @[
                        @{@"响应式编程实现KVO":@"ZWKVOViewController"},
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
