//
//  ZWRootViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWRootViewController.h"
//#import "Masonry.h"
@interface ZWRootViewController ()<UITableViewDataSource,UITableViewDelegate>

/* UITableView */
@property(nonatomic,strong)UITableView *mainTableView;

@end

@implementation ZWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置标题
    self.title = @"功能列表";
    
    //隐藏返回键
    [self setLeftItemHiden:YES];
    
    //添加控件
    [self addSubViews];
    
    //布局
    [self layout];
}

#pragma mark - initUI
#pragma mark -  addView
-(void)addSubViews
{
    [self.view addSubview:self.mainTableView];
    //去除底部多余线
    self.mainTableView.tableFooterView = [UIView new];
}

#pragma mark - layout
-(void)layout
{
   [self.mainTableView  mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.and.left.mas_offset(0);
       make.width.mas_offset(KScreen_Width);
       make.height.mas_offset(KScreen_Height);
   }];
    
    
}


#pragma mark - getter
#pragma mark - mainTableView getter
-(UITableView *)mainTableView
{
    if (_mainTableView == nil) {
        _mainTableView  = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.dataSource = self;
        _mainTableView.delegate   = self;
    }
    return _mainTableView;
}



#pragma mark - Delegate
#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text   = @"ddd";
    return cell;
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
