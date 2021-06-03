//
//  XLPoint.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "XLPoint.h"

@implementation XLPoint

- (void)setType:(PointType)type {
    _type = type;
    switch (type) {
        case PointTypeControl:
            self.layer.backgroundColor = [UIColor blackColor].CGColor;
            break;
        case PointTypeMove:
            self.layer.backgroundColor = [UIColor blueColor].CGColor;
            break;
        default:
            self.layer.backgroundColor = [UIColor redColor].CGColor;
            break;
    }
}

@end
