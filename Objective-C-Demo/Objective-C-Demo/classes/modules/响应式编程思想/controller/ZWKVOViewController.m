//
//  ZWKVOViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/8.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ZWKVOViewController.h"
#import "Person.h"
#import "NSObject+zw_Kvo.h"
@interface ZWKVOViewController ()


@property(nonatomic,strong) Person *person;

@end

@implementation ZWKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"响应式编程实现KVO";
    
    [self method2];
}

-(void)method2
{
    //实现KVO 就是监听set方法
    
    Person *person = [[Person alloc]init];
    
    [person zw_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    self.person    = person;
}

-(void)method1
{
    //实现KVO 就是监听set方法
    
    Person *person = [[Person alloc]init];
    
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    self.person    = person;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"age==>");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.person removeObserver:self forKeyPath:@"age"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.person.age ++;
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
