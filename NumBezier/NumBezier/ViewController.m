//
//  ViewController.m
//  NumBezier
//
//  Created by MyMac on 15/9/22.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+BezierAnimation.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *label;  /**< 余额数值*/
@property (nonatomic,strong) UIButton *start; /**< 开始按钮*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.start];
    
    
}

- (void)startClick{

    [self.label animationFromNum:0 toNum:0.87 duration:6.0];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@",self.label.text);
    });
    
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}

- (UIButton *)start{
    if (!_start) {
        _start = [[UIButton alloc] init];
        [_start setTitle:@"开始" forState:UIControlStateNormal];
        [_start addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
        _start.backgroundColor = [UIColor orangeColor];
    }
    return _start;
}

- (void)viewWillLayoutSubviews{
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.left.mas_equalTo(self.view.mas_left).with.offset(20);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-20);
        make.top.mas_equalTo(self.view.mas_top).with.offset(30);
        make.height.mas_equalTo(@30);
    }];
    
    
    [self.start mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.label);
        make.centerX.mas_equalTo(self.label.mas_centerX);
        make.top.mas_equalTo(self.label.mas_bottom).with.offset(10);
    }];
    
    
}


@end
