//
//  ZWViewDragViewController.m
//  Objective-C-Demo
//
//  Created by rayootech on 16/6/4.
//  Copyright © 2016年 rayootech. All rights reserved.
//


#import "ZWDrawerViewController.h"

//顶部偏移量
#define kMaxY 80
//右边停留位置
#define kTargetR 275
//左边停留位置
#define kTargetL -250
// 宏的操作原理，每输入一个字母就会直接把宏右边的拷贝，并且会自动补齐前面的内容。


@interface ZWDrawerViewController ()

@end

@implementation ZWDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置标题
    self.title = @"抽屉效果";
    
    //隐藏返回键
    [self setLeftItemHiden:NO];
    
    // 添加子控件
    [self setUpChildView];
    
    // 添加Pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];

}

// 只要监听的属性一改变，就会调用观察者的这个方法，通知你有新值
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@",NSStringFromCGRect(_mainV.frame));
    
    if (_mainV.frame.origin.x > 0) { // 往右边移动，隐藏蓝色的view
        _rightV.hidden = YES;
        
    }else if (_mainV.frame.origin.x < 0){ // 往左边移动，显示蓝色的view
        _rightV.hidden = NO;
        
    }
}

#pragma mark - pan的方法
- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取手势的移动的位置
    CGPoint transP = [pan translationInView:self.view];
    // 获取X轴的偏移量
    CGFloat offsetX = transP.x;
    // 修改mainV的Frame
    _mainV.frame = [self frameWithOffsetX:offsetX];
    // 判断下mainV的x是否大于0
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    // 复位
    [pan setTranslation:CGPointZero inView:self.view];
    
    // 判断下当手势结束的时候，定位
    if (pan.state == UIGestureRecognizerStateEnded) {
        // 定位
        CGFloat target = 0;
        // 1.判断下main.x > screenW * 0.5,定位到右边 x=275
        if (_mainV.frame.origin.x > KScreen_Width * 0.5) {
            // 定位到右边
            target = kTargetR;
        }else if (CGRectGetMaxX(_mainV.frame) < KScreen_Width * 0.5){
            // 2.判断下max(main.x) < screenW * 0.5
            target = kTargetL;
        }
        // 获取x轴偏移量
        CGFloat offsetX = target - _mainV.frame.origin.x;
        
        [UIView animateWithDuration:0.25 animations:^{
            _mainV.frame = target == 0?self.view.bounds:[self frameWithOffsetX:offsetX];
        }];
    }
}

#pragma mark - 根据offsetX计算mainV的Frame
- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    // 获取上一次的frame
    CGRect frame = _mainV.frame;

    // X轴每平移一点，Y轴需要移动
    CGFloat offsetY = offsetX * kMaxY / KScreen_Width;
    
    // 获取上一次的高度
    CGFloat preH = frame.size.height;
    
    // 获取上一次的宽度
    CGFloat preW = frame.size.width;
    
    // 获取当前的高度
    CGFloat curH = preH - 2 * offsetY;
    if (frame.origin.x < 0) { // 往左移动
        curH = preH + 2 * offsetY;
    }
    
    // 获取尺寸的缩放比例
    CGFloat scale = curH / preH;
    
    // 获取当前的宽度
    CGFloat curW = preW * scale;
    
    // 更改frame
    // 获取当前X
    frame.origin.x += offsetX;
    
    // 获取当前Y
    CGFloat y = (KScreen_Height - curH) / 2;
    
    frame.origin.y = y;
    
    frame.size.height = curH;
    
    frame.size.width = curW;
    
    return frame;
}

#pragma mark - 添加子控件
- (void)setUpChildView
{
    // left
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.bounds];
    
    leftV.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:leftV];
    
    _leftV = leftV;
    
    // right
    UIView *rightV = [[UIView alloc] initWithFrame:self.view.bounds];
    
    rightV.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:rightV];
    
    _rightV = rightV;
    
    // main
    UIView *mainV = [[UIView alloc] initWithFrame:self.view.bounds];
    
    mainV.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:mainV];
    
    _mainV = mainV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
