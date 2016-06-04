//
//  ZWViewDragViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/4.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWViewDragViewController.h"
#import "ZWDragView.h"

@interface ZWViewDragViewController ()

@end

@implementation ZWViewDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置标题
    self.title = @"拖拽View";
    
    //创建视图
    ZWDragView *dragView=[[ZWDragView alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    dragView.img = [UIImage imageNamed:@"back"];
    [self.view addSubview:dragView];
    
    
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
