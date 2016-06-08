//
//  ZWBlockButtonViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWBlockButtonViewController.h"
#import "ZWBlockButton.h"
#import "UIButton+Block.h"
@interface ZWBlockButtonViewController ()

/* ZWBlockButton */
@property(nonatomic,weak) ZWBlockButton *button;
@property(nonatomic,weak) UIButton *button2;
@end

@implementation ZWBlockButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Button动态绑定block";
    
    //add action
    [self addAction];
    
    //通过类目中方法调用
    [self addAction2];
    
    //layout
    [self layout];
}

#pragma mark - action
-(void)addAction
{
   ZWBlockButton *button = [[ZWBlockButton alloc]initWithFrame:CGRectZero WithBlock:^{
       NSLog(@"自定义按钮绑定block");
   }];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"自定义按钮绑定block" forState:UIControlStateNormal];
    [self.view addSubview:button];
    self.button = button;
}

#pragma mark - action
-(void)addAction2
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectZero];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"类目绑定block" forState:UIControlStateNormal];
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
         NSLog(@"类目绑定block");
    }];
    [self.view addSubview:button];
    self.button2 = button;
}

#pragma mark - layout
-(void)layout
{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
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
