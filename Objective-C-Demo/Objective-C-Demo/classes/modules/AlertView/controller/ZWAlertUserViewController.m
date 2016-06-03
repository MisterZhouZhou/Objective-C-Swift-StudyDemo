//
//  ZWAlertUserViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/3.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWAlertUserViewController.h"
#import "ZWUserAlertView.h"
@interface ZWAlertUserViewController ()

@end

@implementation ZWAlertUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"类似系统的AlertView";
    
    ZWUserAlertView *alertView =[[ZWUserAlertView alloc]initWithTitle:@"提示"
                    message:@"您已被禁言了，您已被禁言了，您已被禁言了，您已被禁言了，您已被禁言了，您已被禁言了" delegate:self sureTitle:@"确定" otherTitle:nil];
    [alertView showInView:self.view];
    
}


-(void)zwAlertViewClickAtButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"点击了确定%ld",(long)buttonIndex);
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
