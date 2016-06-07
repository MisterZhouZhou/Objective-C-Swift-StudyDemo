//
//  ZWFlagViewViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWFlagViewViewController.h"
#import "FlagView.h"

@interface ZWFlagViewViewController ()

@end

@implementation ZWFlagViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置标题
    self.title = @"点赞功能";
    
    FlagView *flageView=[[FlagView alloc]initWithFrame:CGRectMake(50, 100, 100, 30) NoimageName:@"chakanbaominghui" YesimageName:@"chakanbaoming"];
    flageView.flag = FlagModelNO;
    __weak typeof (flageView) weakflagview=flageView;
    flageView.clickFlagMode=^(UIControlFlagMode flagmodel){
        
        switch (flagmodel) {
            case FlagModelNO: //点赞
                [weakflagview setFlag:FlagModelYES withAnimation:YES];
                break;
            case FlagModelYES: //取消点赞
                [weakflagview setFlag:FlagModelNO withAnimation:YES];
                break;
            default:
                break;
        }
    };
    [self.view addSubview:flageView];
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
