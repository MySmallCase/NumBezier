//
//  Bezier.m
//  NumBezier(仿余额宝数字动画)
//
//  Created by MyMac on 15/9/14.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import "Bezier.h"

@implementation Bezier

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initPoints];
    }
    return self;
}

- (void)initPoints{
    BezierPoint start;
    BezierPoint first;
    BezierPoint second;
    BezierPoint end;
    
    start.x = 0;
    start.y = 0;
    first.x = 0;
    first.y = 0.57;
    second.x = 0.44;
    second.y = 1;
    end.x = 1;
    end.y = 1;
    
    
    self.Start = start;
    self.First = first;
    self.Second = second;
    self.End = end;
    
    
}

- (BezierPoint)pointWithDt:(float)dt{
    BezierPoint result;
    
    float t = 1 - dt;
    float tSqure = t * t;
    float tCube = t * tSqure;
    float dtSqure = dt * dt;
    float dtCube = dtSqure * dt;
    
    result.x = self.Start.x * tCube + 3 * self.First.x * dt * tSqure  +  3 * self.Second.x * dtSqure * t + self.End.x * dtCube;
    result.y = self.Start.y * tCube + 3 * self.First.y * dt * tSqure  +  3 * self.Second.y * dtSqure * t + self.End.y * dtCube;
    
    return result;
    
}

@end
