//
//  ZWLoadViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/18.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWLoadViewController.h"
#import "ZWLoadingView.h"
@interface ZWLoadViewController ()
/* 加载视图 */
@property(nonatomic,strong) ZWLoadingView * lv ;
@end

@implementation ZWLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZWLoadingView * lv = [[ZWLoadingView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:lv];
    [lv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
    self.lv = lv;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.lv stop];
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
