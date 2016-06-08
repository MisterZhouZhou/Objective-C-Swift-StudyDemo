//
//  ZWCaculatorViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWCaculatorViewController.h"
#import "UIButton+Block.h"
#import "ZWCaculatorMaker.h"
#import "NSObject+Caculator.h"
@interface ZWCaculatorViewController ()

/* 提示 */
@property(nonatomic,weak)UIButton *button1;
/* 提示 */
@property(nonatomic,weak)UIButton *button2;


@end

@implementation ZWCaculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"链式编程实现计算器";
    
    //调用方式1
    [self addAction1];
    
    //调用方式2
    [self addAction2];
    
    //布局
    [self layout];
    
}

#pragma mark - action
-(void)addAction1
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectZero];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"第一种调用方式" forState:UIControlStateNormal];
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        ZWCaculatorMaker *maker = [[ZWCaculatorMaker alloc]init];
        maker.add(1).add(2).add(3);
        float result = maker.multy(2).result;
        NSLog(@"result ==>%.2f",result);
    }];
    [self.view addSubview:button];
    self.button1 = button;
    
}

-(void)addAction2
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectZero];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"第二种调用方式" forState:UIControlStateNormal];
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        float result = [NSObject makeCaculator:^(ZWCaculatorMaker *maker) {
            maker.add(1).add(2).add(3);
        maker.multy(2);
        }];
        NSLog(@"result ==>%.2f",result);
    }];
    [self.view addSubview:button];
    self.button2 = button;
    
    
}

-(void)layout
{
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
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
