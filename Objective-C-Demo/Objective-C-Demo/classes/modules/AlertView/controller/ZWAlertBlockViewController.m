//
//  ZWAlertBlockViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/3.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWAlertBlockViewController.h"
#import "ZWAlertView.h"
@interface ZWAlertBlockViewController ()

@end

@implementation ZWAlertBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"AlertView绑定block";
    ZWAlertView *alert = [[ZWAlertView alloc]initWithTitle:@"提示"
                                                   message:@"信息"cancelButtonTitle:@"确定" otherButtonTitles:@[@"取消"]
                                                   handler:^(NSInteger index)
                          {
                              NSLog(@"%ld",(long)index);
                              
                          }];
    [alert show];
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
