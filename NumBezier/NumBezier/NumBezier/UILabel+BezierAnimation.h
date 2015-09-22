//
//  UILabel+BezierAnimation.h
//  NumBezier(仿余额宝数字动画)
//
//  Created by MyMac on 15/9/14.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BezierAnimation)

- (void)animationFromNum:(float)fromNum toNum:(float)toNum duration:(float)duration;

@end
