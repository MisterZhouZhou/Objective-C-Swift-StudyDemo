//
//  ZWAlertViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWAlertViewController.h"


@interface ZWAlertViewController ()

@end

@implementation ZWAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"AlertView功能列表";

    //隐藏返回键
    [self setLeftItemHiden:NO];
    
    //设置数据
    [self setdata];
    
}

#pragma mark - data
#pragma mark - 设置数据源
-(void)setdata
{
    self.dataSource = @[
                        @{@"AlertView绑定block":@"ZWAlertBlockViewController"},
                        @{@"类似系统AlertView":@"ZWAlertUserViewController"}
                        
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
