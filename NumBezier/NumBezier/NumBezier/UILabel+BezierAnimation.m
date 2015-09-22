//
//  UILabel+BezierAnimation.m
//  NumBezier(仿余额宝数字动画)
//
//  Created by MyMac on 15/9/14.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import "UILabel+BezierAnimation.h"

#import "Bezier.h"

#define KMaxTimes 100

@implementation UILabel (BezierAnimation)

NSMutableArray *totlePoints; //记录所有的点
Bezier *bezier;  //通过bezier函数的参数变化改变动画的样式
float _duration; //动画间隔
float _fromNum;  //开始数值
float _toNum;  //结束数值
float _lastTime;
int _index;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //初始化贝塞尔曲线
        [self initBezier];
        
        [self cleanVars];
        
    }
    return self;
}

- (void)initBezier{
    bezier = [[Bezier alloc] init];
}

- (void)cleanVars{
    _lastTime = 0;
    _index = 0;
    self.text = @"0";
}


- (void)animationFromNum:(float)fromNum toNum:(float)toNum duration:(float)duration{
    [self cleanVars];
    
    _duration = duration;
    _fromNum = fromNum;
    _toNum = toNum;
    
    totlePoints = [NSMutableArray array];
    float dt = 1.0 / (KMaxTimes - 1);
    
    for (NSInteger i = 0; i < KMaxTimes; i ++ ) {
        
        BezierPoint point = [bezier pointWithDt:dt * i];
        
        float currTime = point.x * _duration;
        float currValue = point.y * (_toNum - _fromNum) + _fromNum;
        NSArray *array = [NSArray arrayWithObjects:[NSNumber numberWithFloat:currTime] , [NSNumber numberWithFloat:currValue], nil];
        
        [totlePoints addObject:array];
    }
    [self changeNumberBySelector];
}

- (void)changeNumberBySelector{
    if (_index >= KMaxTimes) {
        self.text = [NSString stringWithFormat:@"%.2f",_toNum];
        return;
    } else {
        NSArray *pointValues = [totlePoints objectAtIndex:_index];
        _index++;
        float value = [(NSNumber *)[pointValues objectAtIndex:1] floatValue];
        
        float currentTime = [(NSNumber *)[pointValues objectAtIndex:0] floatValue];
        float timeDuration = currentTime - _lastTime;
        _lastTime = currentTime;
        self.text = [NSString stringWithFormat:@"%.2f",value];
        [self performSelector:@selector(changeNumberBySelector) withObject:nil afterDelay:timeDuration];
    }
}

@end
