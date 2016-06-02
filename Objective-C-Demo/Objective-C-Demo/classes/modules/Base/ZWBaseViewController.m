//
//  ZWRootViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWBaseViewController.h"

@interface ZWBaseViewController ()

@end

@implementation ZWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //禁止滑动返回
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateSelected];
    [leftButton addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0,0,20,20);
    leftButton.imageView.contentMode = UIViewContentModeCenter;
    
    UIBarButtonItem * leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBar;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setLeftItemHiden:(BOOL)leftItemHiden
{
   self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - 返回事件
-(void) backHome
{
    [self.navigationController popViewControllerAnimated:YES];
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
