//
//  ZWVIewStopViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/5.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWVIewStopViewController.h"
#import "ZWDragStopView.h"
@interface ZWVIewStopViewController ()

@property(nonatomic,strong)ZWDragStopView *dragView;
@end

@implementation ZWVIewStopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置标题
    self.title = @"view的停靠";
    
    //添加子视图
    [self addChild];
    
    //设置布局
    [self layout];

}

-(void)layout
{
    [self.dragView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
}

#pragma mark - 添加子控件
-(void)addChild
{
    //创建视图
    ZWDragStopView *dragView=[[ZWDragStopView alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    dragView.img = [UIImage imageNamed:@"back"];
    [self.view addSubview:dragView];
    self.dragView = dragView;

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
