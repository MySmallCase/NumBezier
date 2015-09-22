//
//  Bezier.h
//  NumBezier(仿余额宝数字动画)
//
//  Created by MyMac on 15/9/14.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct {
    float x;
    float y;
} BezierPoint;


@interface Bezier : NSObject


@property (nonatomic,assign) BezierPoint Start;
@property (nonatomic,assign) BezierPoint First;
@property (nonatomic,assign) BezierPoint Second;
@property (nonatomic,assign) BezierPoint End;

- (BezierPoint)pointWithDt:(float)dt;


@end
